module "ec2" {
  source = "terraform-aws-modules/ec2/aws"
  version = "3.14.2"

  name = var.instance_name

  tags = var.tags
}

data "aws_ami" "amazon-linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Amazon
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.large"

  tags = var.tag
}

variable "subnet_prv1" {
  description = "Private Subnet 1"
  default = "subnet-xxxxxx"
}