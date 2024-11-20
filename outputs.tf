# Output values for OpenVPN Server
output "OpenVPN-Public-ip-address" {
  description = "Public ip address of the OpenVPN server"
  value = aws_instance.OpenVPN.public_ip
}

output "OpenVPN-instance-id" {
  description = "Instance id of the OpenVPN Server"
  value = aws_instance.OpenVPN.id
}


