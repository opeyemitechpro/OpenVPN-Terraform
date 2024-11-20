# SecurtyGrp.tf

# OpenVPN Server Security Group
resource "aws_security_group" "openvpn_SG" {
  # vpc_id      = aws_vpc.Opeyemi_VPC.id
  name_prefix = "${var.project_name}_openvpn_SG_"
  description = "OpenVPN Security Group"

  dynamic "ingress" {
    for_each = var.openvpn_tcp_ports
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = ingress.value
    }
  }

dynamic "ingress" {
    for_each = var.openvpn_udp_ports
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      protocol    = "udp"
      cidr_blocks = ["0.0.0.0/0"]
      description = ingress.value
    }
  }  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
