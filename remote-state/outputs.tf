output "outs" {
  value = {
    "bucket_id" = aws_s3_bucket.terraform_state.id
  }
}

