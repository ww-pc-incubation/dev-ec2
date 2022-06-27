locals {
  tags = {
    "Name" = format("%s-%s", var.prefix_name, var.vpc_name)
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = format("%s-%s", var.prefix_name, var.vpc_name)
  cidr = "10.10.0.0/16"

  azs = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.10.0.0/19","10.10.32.0/19","10.10.64.0/19"]
  public_subnets = ["10.10.96.0/19","10.10.128.0/19","10.10.160.0/19"]

  create_database_subnet_group = false
  create_elasticache_subnet_group = false
  create_redshift_subnet_group = false

  enable_dns_hostnames = true
  enable_dns_support = true

  enable_nat_gateway = true
  single_nat_gateway = true

  manage_default_route_table = true
  default_route_table_name = "${var.vpc_name}-default"

  manage_default_security_group = true
  default_security_group_name = "${var.vpc_name}-default"

  default_security_group_ingress = []
  default_security_group_egress = []

  create_igw = true

  tags = merge(var.default_tags, local.tags)
}

