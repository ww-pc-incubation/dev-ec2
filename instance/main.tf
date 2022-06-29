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

resource "aws_network_interface" "public" {
  subnet_id = var.public_subnet_id
  tags = merge(var.default_tags, local.tags)
}

resource "aws_iam_instance_profile" "profile" {
  name = "ec2-profile"
  role = var.iam_role
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.large"
  tags = merge(var.default_tags, local.tags)
  availability_zone = format("%s%s", var.region, var.availability_zone)
  network_interface {
    network_interface_id = aws_network_interface.public.id
    device_index         = 0
  }

  iam_instance_profile = aws_iam_instance_profile.profile.id

  root_block_device {
    volume_size = 25
    volume_type = "gp2"
    delete_on_termination = true
  }
}

