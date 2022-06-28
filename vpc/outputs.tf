output "outs" {
  value = {
    "vpc_id" = aws_vpc.master.id
    "public_subnet_ids" = aws_subnet.public_subnets.*.id
    "private_subnet_ids" = aws_subnet.private_subnets.*.id
  }
}

