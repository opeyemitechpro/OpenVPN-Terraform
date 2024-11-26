
# Wait for OpenVPN installation and download the profile config file
resource "null_resource" "get_ovpn_config" {
  depends_on = [aws_instance.OpenVPN_Server]

  # Trigger this resource when instance IP changes
  triggers = {
    instance_ip = aws_instance.OpenVPN_Server.public_ip
    ovpn_file  = "${local.openvpn_user}.ovpn"  # Store filename in triggers
  }

  # Wait for OpenVPN installation to complete and file to be created
  provisioner "remote-exec" {
    inline = [
      "while [ ! -f /home/ubuntu/${local.openvpn_user}.ovpn ]; do sleep 20; echo 'Waiting for OpenVPN config file...'; done",
      "echo 'OpenVPN config file is ready!'"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.key_pair.private_key_pem
      host        = aws_instance.OpenVPN_Server.public_ip
    }
  }

  # Download the OpenVPN profile config file
provisioner "local-exec" {
    command = "scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ${local_file.private_key.filename} ubuntu@${aws_instance.OpenVPN_Server.public_ip}:/home/ubuntu/${local.openvpn_user}.ovpn ./${local.openvpn_user}.ovpn"
  }

  # Clean up the .ovpn file after destroy
  provisioner "local-exec" {
    when    = destroy
    command = "rm -f ./${self.triggers.ovpn_file}"
  }
}
