terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "tf-state"
    key = "ec2-instance-state"
    encrypt = true
  }
}


