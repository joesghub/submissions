#!/bin/bash

# Step 1: Update the package list and install required dependencies
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# Step 2: Add the HashiCorp GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# Step 3: Verify the GPG key (optional, but recommended)
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

# Step 4: Add the HashiCorp repository
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Step 5: Update the package list again to include the new HashiCorp repository
sudo apt update

# Step 6: Install Terraform
sudo apt-get install terraform

# Step 7: Verify the installation (optional, but recommended)
terraform --version
