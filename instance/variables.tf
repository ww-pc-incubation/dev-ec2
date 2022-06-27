variable "region" {
  type = string
}

variable "tags" {
  type = map(string)
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

