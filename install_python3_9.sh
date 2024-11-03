#!/bin/bash

# Add Python PPA for Python 3.9 and install Python
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update

# Install Python 3.9, Python 3.9 venv, pip
sudo apt install -y python3.9 python3.9-venv python3-pip 
