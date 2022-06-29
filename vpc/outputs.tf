output "vpc" {
  value = {
    "vpc_id" = aws_vpc.master.id
  }
}
output "public_subnets" {
  value = {
    for subnet in aws_subnet.public_subnets : substr(subnet.availability_zone, -1, 1) => subnet.id
  }
}

output "private_subnets" {
  value = {
    for subnet in aws_subnet.private_subnets : substr(subnet.availability_zone, -1, 1) => subnet.id
  }
}