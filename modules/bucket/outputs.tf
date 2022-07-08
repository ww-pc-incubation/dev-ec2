output "outs" {
  value = {
    "bucket_id" = aws_s3_bucket.instance_config.id
    "bashrc_key" = aws_s3_object.bashrc.key
    "installer_key" = aws_s3_object.installer.key
  }
}

