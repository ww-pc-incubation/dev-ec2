locals {
  tags = {
    "Name" = format("%s-%s", var.prefix_name, var.vpc_name)
  }
}

data "aws_availability_zones" "available" {}

resource "aws_vpc" "master" {  
  cidr_block = "10.0.0.0/16"              
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = merge(var.default_tags, local.tags)
 }

resource "aws_subnet" "private_subnets" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = aws_vpc.master.id
  map_public_ip_on_launch = false
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "10.0.${10+count.index}.0/24"
  tags = merge(var.default_tags, {"Subnet": "private",
    "Name": format("%s-private-subnet-%s", var.prefix_name, 
      data.aws_availability_zones.available.names[count.index])})
}

resource "aws_route_table_association" "PrivateRTassociation" {
  count = "${length(data.aws_availability_zones.available.names)}"
  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.PrivateRT[count.index].id
}

resource "aws_eip" "nateIP" {
  vpc   = true
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.nateIP.id
  subnet_id = aws_subnet.private_subnets[0].id
}

resource "aws_route_table" "PrivateRT" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id = aws_vpc.master.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }
}

resource "aws_internet_gateway" "IGW" {
    vpc_id =  aws_vpc.master.id
}

resource "aws_route_table" "PublicRT" {
  vpc_id =  aws_vpc.master.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}

resource "aws_subnet" "public_subnets" {
  count = "${length(data.aws_availability_zones.available.names)}"
  vpc_id     = aws_vpc.master.id
  map_public_ip_on_launch = true
  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block = "10.0.${20+count.index}.0/24"
  tags = merge(var.default_tags, {"Subnet": "private",
    "Name": format("%s-public-subnet-%s", var.prefix_name, 
      data.aws_availability_zones.available.names[count.index])})
}

resource "aws_route_table_association" "PublicRTassociation" {
  count = "${length(data.aws_availability_zones.available.names)}"
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.PublicRT.id
}

