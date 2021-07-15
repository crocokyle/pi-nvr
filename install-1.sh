#!/bin/bash

# Change hostname
sudo cp conf/hosts /etc/hosts
sudo cp conf/hostname /etc/hostname

# Enable SSH
sudo systemctl enable ssh
sudo systemctl start ssh

# Update/ugprade
sudo apt -y update
sudo apt -y upgrade

# Install autoconf
sudo apt-get install autoconf

# Teamviewer setup
wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb
sudo dpkg -i teamviewer-host_armhf.deb
sudo apt --fix-broken install
sudo rm teamviewer-host_armhf.deb

# inadyn setup
sudo apt-get install inadyn
sudo cp conf/inadyn.conf /etc/inadyn.conf

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
