output "public_instance_ips" {
  value = [for i in aws_instance.public : i.public_ip]
}

output "private_instance_ids" {
  value = [for i in aws_instance.private : i.id]
}