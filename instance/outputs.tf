output "outs" {
  value = {
    "instance_public_ip" = module.ec2.public_id
  }
}

