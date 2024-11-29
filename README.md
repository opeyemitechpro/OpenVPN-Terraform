# Create and Host your own VPN Server for Free on AWS Using Terraform and OpenVPN

This terraform configuration creates a fully functional, free and ready-to-use self-hosted OpenVPN Server in any chosen AWS region.

## Quick Start Guide

Click here for a [Quick Start Guide](https://opeyemitech.pro/my-projects/terraform_projects/openvpn_access_server/#clone-the-repository)

## Full Documentation

A Full documentation with step-by-step guide explaining how the complete module works is captured here: [OpenVPN Access Server Setup](https://opeyemitech.pro/my-projects/terraform_projects/openvpn_access_server/)

## What the script does
- Creates a Ubuntu 22.04 EC2 instance and configures a fully functional OpenVPN Access Server 
- Configures the server as a type `t2-micro` which runs within the AWS Free-tier plan (Learn more about the AWS free-tier plan [here](https://aws.amazon.com/free)) 
- Set up and configure the VPN server with an IP address in the AWS region specified 
- Generates an AWS keypair file for SSH connection to the EC2 instance and saves the file in the terraform working directory locally
- Generates an OpenVPN User Profile file (`*.ovpn`) that will be used to establish an encrypted VPN connection from your local machine to the VPN server
- One command tear down that destroys the whole infrastructure along with the locally created files (the keypair file and the `*.ovpn` user profile file)

## Credits

- Thanks to [Stanislas Agristan](https://github.com/angristan/openvpn-install){ target="_blank" } for the OpenVPN Installer script
- Thanks to [Dominic Dumrauf](https://github.com/dumrauf/openvpn-terraform-install){ target="_blank" } who created a similar terraform solution using Agristan's script and inspired me 