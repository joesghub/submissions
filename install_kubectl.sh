#!/bin/bash
# This script sets up kubectl, the CLI tool for managing Kubernetes clusters.

# Step 1: Download kubectl binary
echo "Downloading kubectl..."
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.2/2024-11-15/bin/linux/amd64/kubectl

# Step 2: Make kubectl executable
echo "Making kubectl executable..."
chmod +x kubectl

# Step 3: Move kubectl to a system-wide location
echo "Installing kubectl..."
sudo mv kubectl /usr/local/bin/

# Step 4: Verify installation
echo "Verifying kubectl installation..."
kubectl version --client

echo "kubectl setup completed!"
