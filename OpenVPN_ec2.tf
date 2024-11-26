resource "aws_instance" "OpenVPN_Server" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = var.OpenVPN_instance_type
  vpc_security_group_ids  = [ aws_security_group.openvpn_SG.id ]
  user_data               = templatefile("./openvpn_userdata.tpl", {openvpn_user = local.openvpn_user})
  key_name                = aws_key_pair.key_pair.key_name

root_block_device {
    volume_size           = 8
  }

# Set the metadata service to allow IMDSv2
metadata_options {
    http_tokens                 = "optional"    # Allows IMDSv1 and IMDSv2
    http_put_response_hop_limit = 1      # Default hop limit for the PUT request
    http_endpoint               = "enabled"     # Enable metadata service
  }

tags = {
    Name = "${var.project_name}_Server"
    Region    = var.selected_region
    KeyPair   = local.key_pair_name
    Project   = var.project_name
  }

}

locals {
  # Create key name with OpenVPN-Keypair prefix and region
  key_pair_name = "OpenVPN-Keypair-${var.selected_region}"

  # Create Profile name for the OpenVPN User
  openvpn_user = "OpeyemiTechPro-${var.selected_region}"

  # Display formatted region information
  region_display = join("\n", [for region, location in var.aws_regions : format("%s = %s", region, location)])

}


# Generate a private key
resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create key pair in AWS
resource "aws_key_pair" "key_pair" {
  key_name   = local.key_pair_name
  public_key = tls_private_key.key_pair.public_key_openssh

# tag the key pair
  tags = {
    Name        = local.key_pair_name
    Region      = var.selected_region
    Project     = var.project_name
    CreatedBy   = "Terraform"
  }
}

# Save private key locally
resource "local_file" "private_key" {
  content         = tls_private_key.key_pair.private_key_pem
  filename        = "${local.key_pair_name}.pem"
  file_permission = "0400"
}


# Create a null resource to display available regions
resource "null_resource" "region_display" {
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "Available AWS Regions:"
      echo "${local.region_display}"
      echo "\nSelected Region: ${var.selected_region} (${var.aws_regions[var.selected_region]})"
    EOT
  }
}

