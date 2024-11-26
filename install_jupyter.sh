#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update -y && sudo apt upgrade -y

# Install Python3, pip, and venv
echo "Installing Python3, pip, and venv..."
sudo apt install python3-pip python3-venv -y

# Create a directory for Jupyter and set up a virtual environment
echo "Setting up a virtual environment for Jupyter..."
mkdir -p jupyter
cd jupyter
python3 -m venv jupyter_env
source jupyter_env/bin/activate

# Install Jupyter Notebook
echo "Installing Jupyter Notebook..."
pip install jupyter

# Start Jupyter Notebook
echo "Starting Jupyter Notebook..."
jupyter notebook --ip=0.0.0.0 --no-browser
