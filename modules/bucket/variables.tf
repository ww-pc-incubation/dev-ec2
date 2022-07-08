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

variable "bashrc_file" {
  type = string
  default = "../resources/bashrc.sh"
}

variable "installer_file" {
  type = string
  default = "../resources/installer.sh"
}