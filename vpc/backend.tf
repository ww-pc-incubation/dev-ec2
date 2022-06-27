terraform {
  backend "s3" {
    region = "eu-west-1"
    bucket = "tf-state"
    key = "vpc-state"
    encrypt = true
  }
}


