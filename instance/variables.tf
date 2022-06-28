variable "region" {
  type = string
}

variable "default_tags" {
  type = map(string)
  default = {
    "Managed by Terraform" = "True"
  }
}

variable "instance_name" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "ssh_key" {
  type = string
}

variable "ssm_enabled" {
  type = string
}

variable "iam_role" {
  type = string
}

variable "subnet_private" {
  description = "Private Subnet"
  type = string
}

variable "availability_zone" {
  description = "Instance availability zone"
  type = string
  default = format("%sa", var.region)
}
