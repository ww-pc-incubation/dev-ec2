region = "eu-west-1"

prefix_name = "carlton"

default_tags = {
  "Managed by Terraform" = "True"
  "Environment" = "CX"
  "Owner" = "paul.carlton@weave.works"
}

instance_name = "dev"

ssh_key = "paul"

iam_role = "paulcarlton-ec2"
