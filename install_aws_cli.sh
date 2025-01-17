#!/bin/bash

# Step 1: Install unzip if not installed
sudo apt-get update
sudo apt-get install -y unzip

# Step 2: Download the AWS CLI v2 installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Step 3: Open the downloaded file
unzip awscliv2.zip

# Step 4: Run the installation script
sudo ./aws/install

# Step 5: Verify the installation by checking the version
aws --version
