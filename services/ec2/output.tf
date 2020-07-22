output "ip_address" {
  value = "${module.ec2.instance_ip}"
}