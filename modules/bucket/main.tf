
locals {
  bucket_name = format("%s-%s", var.prefix_name, var.bucket_name)
  tags = {
    "Name" = local.bucket_name
  }
}

resource "aws_s3_bucket" "instance_config" {
  bucket = local.bucket_name

  tags = merge(var.default_tags, local.tags)

  # lifecycle {
  #     prevent_destroy = true
  # }

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

# resource "aws_s3_bucket_public_access_block" "s3_public_access" {
#   bucket = aws_s3_bucket.instance_config.id

#   block_public_acls   = true
#   block_public_policy = true
#   ignore_public_acls  = true
#   restrict_public_buckets = true
# }

data "archive_file" "resources" {
  type        = "zip"
  source_dir  = "../resources"
  output_path = "/tmp/resources.zip"
}

resource "aws_s3_object" "resources" {
  bucket = aws_s3_bucket.instance_config.id
  key    = "resources"
  source = "${data.archive_file.resources.output_path}"
  source_hash = filemd5("${data.archive_file.resources.output_path}")
}

data "archive_file" "utilities" {
  type        = "zip"
  source_dir  = "../bin"
  output_path = "/tmp/utilities.zip"
}

resource "aws_s3_object" "utilities" {
  bucket = aws_s3_bucket.instance_config.id
  key    = "utilities"
  source = "${data.archive_file.utilities.output_path}"
  source_hash = filemd5("${data.archive_file.utilities.output_path}")
}
