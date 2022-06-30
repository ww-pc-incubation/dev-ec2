
locals {
  bucket_name = format("%s-%s", var.prefix_name, var.bucket_name)
  tags = {
    "Name" = local.bucket_name
  }
}

resource "aws_s3_bucket" "instance_config" {
  bucket = local.bucket_name

  tags = merge(var.default_tags, local.tags)

  lifecycle {
      prevent_destroy = true
  }

}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  versioning_configuration {
    status = "Enabled"
  }
  bucket = aws_s3_bucket.instance_config.id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encrypt" {
  rule {
      apply_server_side_encryption_by_default {
          sse_algorithm = "AES256"
      }
  }
  bucket = aws_s3_bucket.instance_config.id
}

resource "aws_s3_bucket_acl" "private_bucket" {
  bucket = aws_s3_bucket.instance_config.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_public_access" {
  bucket = aws_s3_bucket.instance_config.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "bashrc" {
  bucket = aws_s3_bucket.instance_config.id
  key    = "bashrc"
  source = var.bashrc_file

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  source_hash = filemd5(var.bashrc_file)
}