output "key" {
  value = aws_key_pair.instance_key.public_key
}

output "instance_ip" {
  value = aws_instance.instance.public_ip
}

