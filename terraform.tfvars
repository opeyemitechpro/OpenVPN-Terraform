# Project Details
project_name = "Opeyemi_OpenVPN_YT"
region_name = "us-east-2"
key_pair_name = "OpeyemiTechPro-KeyPair"


# Variables for OpenVPN Server
# OpenVPN_instance_ami = "ami-085f9c64a9b75eed5" # Ubuntu ami
OpenVPN_instance_type = "t2.micro"
openvpn_user = "OpeyemiTechPro"

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

