variable "region" {
  type = string
}

variable "default_tags" {
  type = map(string)
  default = {
    "Managed by Terraform" = "True"
  }
}

variable "bucket_name" {
  type = string
}

variable "prefix_name" {
  type = string
}
