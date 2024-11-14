#!/bin/bash

# Step 1: Download the AWS CLI v2 installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Step 2: Unzip the downloaded file
unzip awscliv2.zip

# Step 3: Run the installation script
sudo ./aws/install

# Step 4: Verify the installation by checking the version
aws --version
