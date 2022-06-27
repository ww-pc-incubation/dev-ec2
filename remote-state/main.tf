
locals {
  bucket_name = format("%s-%s", var.prefix_name, var.bucket_name)
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = local.bucket_name

  tags = var.tags

  lifecycle {
      prevent_destroy = true
  }

}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  versioning_configuration {
    status = "Enabled"
  }
  bucket = aws_s3_bucket.terraform_state.id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypt" {
  rule {
      apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
      }
  }
  bucket = aws_s3_bucket.terraform_state.id
}

resource "aws_s3_bucket_acl" "private_bucket" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_public_access" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}