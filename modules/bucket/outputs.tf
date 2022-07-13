output "outs" {
  value = {
    "bucket_id" = aws_s3_bucket.instance_config.id
    "utilities_key" = aws_s3_object.utilities.key
    "resources_key" = aws_s3_object.resources.key
  }
}

