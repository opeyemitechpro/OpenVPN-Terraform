# Project Details
project_name = "Opeyemi_OpenVPN_YT"


# Variables for OpenVPN Server
OpenVPN_instance_type = "t2.micro"

# OpenVPN Server port Details
openvpn_tcp_ports = {
  "22" = "SSH Access"
  "80"  = "HTTP Access"
  "443" = "HTTPS Access" 
  "943" = "OpenVPN Management Port"
  }

openvpn_udp_ports = {
  "1194" = "OpenVPN udp Port"
  }

