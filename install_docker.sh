#!/bin/bash

# Step 1: Update system and install prerequisites
echo "Updating system and installing prerequisites..."
sudo apt-get update -y
sudo apt-get install -y ca-certificates curl lsb-release

# Step 2: Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Step 3: Add the Docker repository to Apt sources
echo "Adding Docker repository to Apt sources..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Step 4: Update apt repository list
echo "Updating apt package list..."
sudo apt-get update -y

# Step 5: Install Docker
echo "Installing Docker..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 6: Create the docker group (if not already created)
echo "Creating the docker group (if not exists)..."
if ! getent group docker > /dev/null 2>&1; then
  sudo groupadd docker
else
  echo "Docker group already exists."
fi

# Step 7: Add user to the Docker group
echo "Adding user $USER to the docker group..."
sudo usermod -aG docker $USER

# Step 8: Apply group changes
echo "Applying group changes (newgrp)..."
newgrp docker

# Step 9: Verify Docker installation
echo "Verifying Docker installation with hello-world image..."
docker run hello-world

# Step 10: Final verification of the installation and group membership
echo "Verifying user is in the Docker group..."
groups $USER
id -nG $USER

# Step 11: Final message
echo "Docker installation complete. Please log out and log back in for group changes to fully take effect."

