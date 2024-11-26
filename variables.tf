
variable "project_name" {
  description = "Title of the Project"
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

variable "aws_regions" {
  type = map(string)
  default = {
    "us-east-1"      = "N. Virginia"
    "us-east-2"      = "Ohio"
    "us-west-1"      = "N. California"
    "us-west-2"      = "Oregon"
    "af-south-1"     = "Cape Town"
    "ap-east-1"      = "Hong Kong"
    "ap-south-1"     = "Mumbai"
    "ap-southeast-1" = "Singapore"
    "ap-southeast-2" = "Sydney"
    "ap-southeast-3" = "Jakarta"
    "ap-northeast-1" = "Tokyo"
    "ap-northeast-2" = "Seoul"
    "ap-northeast-3" = "Osaka"
    "ca-central-1"   = "Canada Central"
    "eu-central-1"   = "Frankfurt"
    "eu-west-1"      = "Ireland"
    "eu-west-2"      = "London"
    "eu-west-3"      = "Paris"
    "eu-north-1"     = "Stockholm"
    "eu-south-1"     = "Milan"
    "eu-south-2"     = "Zurich"
    "me-south-1"     = "Bahrain"
    "me-central-1"   = "UAE"
    "sa-east-1"      = "São Paulo"
  }
}

variable "selected_region" {
  type        = string
  description = "Enter the AWS region where you want to deploy your OpenVPN Server and press Enter:"

  validation {
    condition     = can(regex("^(eu|us|ap|ca|sa|me|af|il|cn)-(central|west|east|north|south|southeast|northeast)-[1-3]$", var.selected_region))
    error_message = "Please select a valid AWS region from the provided list."
  }
}