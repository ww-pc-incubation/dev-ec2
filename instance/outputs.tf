output "outs" {
  value = {
    "instance_id" = aws_instance.dev.id
    "public_ip" = aws_instance.dev.public_ip
  }
}

