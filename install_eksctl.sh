#!/bin/bash
# This script sets up eksctl, the CLI tool for managing Amazon EKS clusters.

# Step 1: Define system architecture
# Adjust ARCH for ARM systems if needed (e.g., arm64, armv6, armv7)
ARCH=amd64

# Step 2: Define the platform based on system name and architecture
PLATFORM=$(uname -s)_$ARCH

# Step 3: Download the eksctl tarball for the appropriate platform
echo "Downloading eksctl for platform $PLATFORM..."
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# Step 4: (Optional) Verify checksum to ensure download integrity
echo "Verifying checksum..."
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

# Step 5: Extract the tarball and move the binary to a system-wide location
echo "Installing eksctl..."
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv /tmp/eksctl /usr/local/bin

# Step 6: Verify installation
echo "Verifying eksctl installation..."
eksctl version

echo "eksctl setup completed!"
