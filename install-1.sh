#!/bin/bash

# Change hostname
sudo cp hosts /etc/hosts
sudo cp hostname /etc/hostname

# Update to use testing
sudo cp sources.list /etc/apt/sources.list

sudo apt -y update
sudo apt -y full-upgrade

# Teamviewer setup
wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb
sudo dpkg -i teamviewer-host_armhf.deb
sudo apt --fix-broken install

# ddclient setup
sudo apt-get install ddclient

sudo apt install snapd
echo ""
echo "Complete!"
echo "Please update OpenGL drivers to prevent CPU issues"
echo "Start by running 8 Update"
echo "Next, navigate to Advanced Options > GL Driver > GL (Fake KMS)"
read -p "Press ENTER to open raspi-config"
sudo raspi-config

read -p "Next, we will reboot. After the reboot, please run install-2.sh. Press ENTER to reboot now."
sudo reboot
