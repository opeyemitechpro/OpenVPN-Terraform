resource "aws_instance" "OpenVPN" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = var.OpenVPN_instance_type
  vpc_security_group_ids  = [ aws_security_group.openvpn_SG.id ]
  user_data               = templatefile("./openvpn_userdata.tpl", {openvpn_user = var.openvpn_user})
  key_name                = var.key_pair_name

root_block_device {
    volume_size           = 8
  }

metadata_options {
    http_tokens                 = "optional"    # Allows IMDSv1 and IMDSv2
    http_put_response_hop_limit = 1      # Default hop limit for the PUT request
    http_endpoint               = "enabled"     # Enable metadata service
  }

tags = {
    Name = "${var.project_name}_Server"
  }
}
