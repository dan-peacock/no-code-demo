output "vm_IP" {
  value = "The IP address for your VM is ${aws_instance.no-code.public_ip}"
}