#!/bin/bash

# Update system and install necessary packages
sudo apt update && sudo apt install -y fontconfig openjdk-17-jre software-properties-common

# Add Python PPA for Python 3.9 and install Python
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update

# Install Python 3.9, Python 3.9 venv, pip, and nginx
sudo apt install -y python3.9 python3.9-venv python3-pip nginx

# Download Jenkins key and add Jenkins repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update system and install Jenkins
sudo apt-get update
sudo apt-get install -y jenkins

# Upgrade all packages
sudo apt-get upgrade -y

# Start Jenkins and check its status
sudo systemctl start jenkins
sudo systemctl status jenkins
