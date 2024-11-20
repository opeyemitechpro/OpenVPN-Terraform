
variable "project_name" {
  description = "Title of the Project"
  type        = string
}

variable "region_name" {
  description = "AWS Region where infrstructure will be provisioned"
  type        = string
}

variable "key_pair_name" {
  description = "Name of the existing EC2 key pair"
  type        = string
}

variable "OpenVPN_instance_type" {
  description = "The type of EC2 instance to launch for the OpenVPN Server"
  type        = string
}
variable "openvpn_tcp_ports" {
  type = map(string)
  description = "Map of OpenVPN ports to their descriptions"
}

variable "openvpn_udp_ports" {
  type = map(string)
  description = "Map of OpenVPN UDP ports to their descriptions"
}

variable "openvpn_user" {
  type = string
  description = "OpenVPN User Profile Name"
}