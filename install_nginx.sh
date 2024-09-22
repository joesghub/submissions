#!/bin/bash

# Update the package list
sudo apt update

# Install NGINX
sudo apt install -y nginx

# Enable NGINX to start on boot
sudo systemctl enable nginx

# Start the NGINX service
sudo systemctl start nginx

# Allow NGINX through the firewall (if using UFW)
sudo ufw allow 'Nginx HTTP'

# Check the status of NGINX
sudo systemctl status nginx
