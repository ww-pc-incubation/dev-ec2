locals {
  tags = {
    "Name" = format("%s-%s", var.prefix_name, var.instance_name)
  }
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

resource "aws_instance" "dev" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.large"
  tags = merge(var.default_tags, local.tags)
  name = format("%s-%s", var.prefix_name, var.instance_name)
}

variable "subnet_prv1" {
  description = "Private Subnet 1"
  default = "subnet-xxxxxx"
}