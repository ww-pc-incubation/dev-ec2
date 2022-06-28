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

resource "aws_vpc" "vpc" {
  
}

resource "aws_network_interface" "private" {
  subnet_id   = aws_subnet.my_subnet.id

  tags = merge(var.default_tags, local.tags)
}

resource "aws_instance" "dev" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.large"
  tags = merge(var.default_tags, local.tags)
  name = format("%s-%s", var.prefix_name, var.instance_name)
  availability_zone = "var.availability_zone"
  #network_interface = aws_network_interface.private.subnet_id
  root_block_device {
    volume_size = 25
    volume_type = "gp2"
    delete_on_termination = true
  }
}

