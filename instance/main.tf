

locals {
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
  description = "Allow TLS inbound traffic"
  vpc_id      = module.vpc.vpc.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [format("%s/32",var.source_ip)]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(var.default_tags, local.tags)
}
resource "aws_instance" "dev" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.large"
  tags = merge(var.default_tags, local.tags)
  availability_zone = format("%s%s", var.region, var.availability_zone)
  subnet_id = module.vpc.public_subnets[var.availability_zone]
  user_data_base64 = var.user_data

  iam_instance_profile = aws_iam_instance_profile.profile.id
  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name = var.ssh_key

  root_block_device {
    volume_size = 25
    volume_type = "gp2"
    delete_on_termination = true
  }
}

