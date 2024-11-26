# Output values for OpenVPN Server
output "OpenVPN-Public-ip-address" {
  description = "Public ip address of the OpenVPN server"
  value = aws_instance.OpenVPN_Server.public_ip
}

# Display the instance-ID of the OpenVPN Server
output "OpenVPN-instance-id" {
  description = "Instance id of the OpenVPN Server"
  value = aws_instance.OpenVPN_Server.id
}

# Display the instance-ID of the OpenVPN Server
output "key_pair_name" {
  description = "Name of the created key pair"
  value       = local.key_pair_name
}

# Display the path of the private key file
output "private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}

# Dispaly the ssh connection string
output "ssh_connection_string" {
  description = "SSH connection string"
  value       = "ssh -i ${local_file.private_key.filename} ubuntu@${aws_instance.OpenVPN_Server.public_ip}"
}

# Display the path of the downloaded ovpn profile config file
output "ovpn_config_path" {
  value       = "./${local.openvpn_user}.ovpn"
  description = "Path to the downloaded OpenVPN config file"
}

# Display the path of the downloaded ovpn profile config fil
output "ovpn_download_complete" {
  value = "OpenVPN Profile config file has been downloaded to: ${local.openvpn_user}.ovpn"
}

# Display the next step to access the VPN server
output "Next_Steps" {
  value = <<-EOT
    To use your OpenVPN configuration:
    1. Download and Install the OpenVPN Connect client software on your device from here: https://openvpn.net/client/
    2. Import the configuration file: ${local.openvpn_user}.ovpn
    3. Connect to your VPN server
    
    The configuration file is located at: ./${local.openvpn_user}.ovpn
  EOT
}
