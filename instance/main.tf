

locals {
  mgmt_repo = format("%s-%s-mgmt", var.prefix_name, var.instance_name)
  ssm_param_path = format("/%s/%s", var.prefix_name, var.instance_name)
  tags = {
    "Name" = format("%s-%s", var.prefix_name, var.instance_name)
  }
}

module "vpc" {
  source = "../modules/vpc"
  prefix_name = var.prefix_name
  vpc_name = "master"
  default_tags = var.default_tags
  region = var.region
}

module "bucket" {
  source = "../modules/bucket"
  prefix_name = var.prefix_name
  bucket_name = "instance-config"
  default_tags = var.default_tags
  region = var.region
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}

resource "aws_iam_instance_profile" "profile" {
  name = "ec2-profile"
  role = var.iam_role
}

resource "aws_security_group" "instance" {
  name        = "allow_tls"
  description = "Allow ssh and k8s inbound traffic"
  vpc_id      = module.vpc.vpc.vpc_id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.default_tags, local.tags)
}

resource "aws_security_group_rule" "k8s" {
  description      = "k8s from client"
  from_port        = 6443
  to_port          = 6443
  protocol         = "tcp"
  cidr_blocks      = [format("%s/32",var.source_ip)]
  security_group_id = aws_security_group.instance.id
  type = "ingress"
}

resource "aws_security_group_rule" "k8s-internal" {
  description      = "k8s on public ip from instance"
  from_port        = 6443
  to_port          = 6443
  protocol         = "tcp"
  source_security_group_id = aws_security_group.instance.id
  security_group_id = aws_security_group.instance.id
  type = "ingress"
}


resource "aws_security_group_rule" "ssh" {
  description      = "k8s from client"
  from_port        = 22
  to_port          = 22
  protocol         = "tcp"
  cidr_blocks      = [format("%s/32",var.source_ip)]
  security_group_id = aws_security_group.instance.id
  type = "ingress"
}

resource "aws_ssm_parameter" "github" {
  name        = format("%s/github-token", local.ssm_param_path)
  description = "Github token"
  type        = "SecureString"
  value       = var.github_token
  tags = merge(var.default_tags, local.tags)
}

resource "local_file" "cloud_init" {
    content  = <<-EOT
    #!/usr/bin/env bash

    set -x

    export PATH=$PATH:/usr/local/bin

    amazon-linux-extras install epel -y

    echo "Updating system packages & installing required utilities"
    yum-config-manager --enable epel
    yum update -y
    yum install -y jq curl unzip git
    curl $curl_proxy_opt "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
    sudo yum install -y session-manager-plugin.rpm

    echo "#!/usr/bin/env bash" > /usr/local/install-awscli.sh
    echo "TMPDIR=$(mktemp -d)" >> /usr/local/install-awscli.sh
    echo "pushd $TMPDIR" >> /usr/local/install-awscli.sh
    echo 'curl $curl_proxy_opt "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"' >> /usr/local/install-awscli.sh
    echo "unzip -q awscliv2.zip >/dev/null" >> /usr/local/install-awscli.sh
    echo "./aws/install >/dev/null" >> /usr/local/install-awscli.sh
    echo "popd" >> /usr/local/install-awscli.sh
    chmod 755 /usr/local/install-awscli.sh
    /usr/local/install-awscli.sh

    echo "Installing SSM Agent"
    yum install -y https://s3.$AWS_REGION.amazonaws.com/amazon-ssm-$AWS_REGION/latest/linux_amd64/amazon-ssm-agent.rpm
    systemctl enable amazon-ssm-agent
    systemctl start amazon-ssm-agent
    systemctl status amazon-ssm-agent

    mkdir /etc/ec2-dev
    chmod 755 /etc/ec2-dev
    mkdir /usr/local/bin
    chmod 755 /usr/local/bin

    echo "export CONFIG_BUCKET=${module.bucket.outs.bucket_id}" > /etc/ec2-dev/aws-config.sh
    echo "export GITHUB_TOKEN_SSM_PARAM=${aws_ssm_parameter.github.name}" >> /etc/ec2-dev/aws-config.sh
    echo "export MGMT_ORG=${var.mgmt_org}" >> /etc/ec2-dev/aws-config.sh
    echo "export MGMT_REPO=${local.mgmt_repo}" >> /etc/ec2-dev/aws-config.sh
    echo "export AWS_REGION=$(curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')" >> /etc/ec2-dev/aws-config.sh

    echo '#!/usr/bin/env bash' > /usr/local/bin/s3-download.sh
    echo 'source /etc/ec2-dev/aws-config.sh' >> /usr/local/bin/s3-download.sh
    echo 'aws s3 cp s3://$CONFIG_BUCKET/${module.bucket.outs.resources_key} /tmp/resources.zip' >> /usr/local/bin/s3-download.sh
    echo 'unzip -o -d /etc/ec2-dev /tmp/resources.zip' >> /usr/local/bin/s3-download.sh
    echo 'chmod 644 /etc/ec2-dev/*' >> /usr/local/bin/s3-download.sh
    echo 'chown -R root:root /etc/ec2-dev' >> /usr/local/bin/s3-download.sh
    echo 'aws s3 cp s3://$CONFIG_BUCKET/${module.bucket.outs.utilities_key} /tmp/utilities.zip' >> /usr/local/bin/s3-download.sh
    echo 'unzip -o -d /usr/local/bin /tmp/utilities.zip' >> /usr/local/bin/s3-download.sh
    echo 'chmod 755 /usr/local/bin/*' >> /usr/local/bin/s3-download.sh
    echo 'chown -R root:root /usr/local/bin' >> /usr/local/bin/s3-download.sh
    echo 'chmod 755 /usr/local/bin/*' >> /usr/local/bin/s3-download.sh
    echo 'chown -R root:root /usr/local/bin' >> /usr/local/bin/s3-download.sh

    chmod 755 /usr/local/bin/s3-download.sh
    chown root:root /usr/local/bin/s3-download.sh
    export PATH=$PATH:/usr/local/bin
    export HOME=/root
    s3-download.sh
    installer.sh
    bootstrap-cluster.sh
    EOT
    filename = "/tmp/cloud-init.sh"
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.large"
  tags = merge(var.default_tags, local.tags)
  availability_zone = format("%s%s", var.region, var.availability_zone)
  subnet_id = module.vpc.public_subnets[var.availability_zone]
  user_data_base64 = base64encode(local_file.cloud_init.content)

  iam_instance_profile = aws_iam_instance_profile.profile.id
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name = var.ssh_key

  root_block_device {
    volume_size = 25
    volume_type = "gp2"
    delete_on_termination = true
  }
}
