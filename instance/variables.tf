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

variable "prefix_name" {
  type = string
}

variable "ssh_key" {
  type = string
}

variable "ssm_enabled" {
  type = string
  default = true
}

variable "iam_role" {
  type = string
  default = "paulcarlton-ec2"
}

variable "private_subnet_id" {
  description = "Private Subnet"
  type = string
}

variable "availability_zone" {
  description = "Instance availability zone"
  type = string
  default = "a"
}
