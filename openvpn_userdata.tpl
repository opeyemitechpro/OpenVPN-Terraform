#!/bin/bash

# Bash script to intialize OpenVPN Server

# Set error trap
set -e # Exit script immediately on first error.

# Log all output to file 
exec >> /var/log/setup_script.log 2>&1

echo "Initializing script..."
echo
echo "Updating packages..."
sudo apt update -y
echo
echo "Setting FQDN  & Public IP"
echo
FQDN=$(curl -sS http://169.254.169.254/latest/meta-data/public-hostname)
PUB_IP=$(curl -sS http://169.254.169.254/latest/meta-data/public-ipv4)


echo "$FQDN"
echo
echo "$PUB_IP"
echo 
echo "Download installation script"
echo
# REFER: https://github.com/angristan/openvpn-install

wget https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh -O openvpn-install.sh
chmod +x openvpn-install.sh 

echo "Installing OpenVPN Access Server..."
echo
sudo AUTO_INSTALL=y \
     APPROVE_IP=$PUB_IP \
     ENDPOINT=$FQDN \
	CLIENT=${openvpn_user} \
     ./openvpn-install.sh


echo "Moving User Profile ${openvpn_user}.ovpn to the Ubuntu user home directory..."
echo
mv /root/${openvpn_user}.ovpn /home/ubuntu/${openvpn_user}.ovpn

echo
echo "Hurray! OpenVPN Installed succesfully"

# Rename Hostname
echo "Set hostname as OpenVPN-Server..."
sudo hostnamectl set-hostname OpenVPN-Server 

