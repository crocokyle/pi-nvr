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

# Teamviewer setup
wget https://download.teamviewer.com/download/linux/teamviewer-host_armhf.deb
sudo dpkg -i teamviewer-host_armhf.deb
sudo apt --fix-broken install
sudo rm teamviewer-host_armhf.deb

# DDNS Setup
# Prompt for username/password
echo ""
echo "==================================================================================="
echo "Please retrieve your Google DDNS username/password"
echo ""
echo "If you haven't set this up yet, navigate to https://domains.google.com/registrar/"
echo "Select your domain > Manage > DNS > Show Advanced Settings > Manage dynamic DNS"
echo "Leave the host blank or enter a subdomain."
echo 'Click "Save"'
echo 'Click "View credentials"'
echo ""
echo "==================================================================================="
echo ""
echo "Enter your Google Domain DDNS Username:"
read DDNSUSER
echo "Enter your Google Domain DDNS Password:"
read DDNSPASS

# Create log file
sudo touch /var/log/ddns
sudo chmod 777 /var/log/ddns

# Replace user/pass
cp ddns-backup.sh ddns.sh
sed -i "s/USER_NAME/$DDNSUSER/g" ddns.sh
sed -i "s/PASS_WORD/$DDNSPASS/g" ddns.sh

# Create cron job
crontab conf/cron

# Setup snapd
sudo apt install snapd
echo ""
echo "Complete!"

# Update OpenGL Driver
echo "Please update OpenGL drivers to prevent CPU issues"
echo "Start by running 8 Update"
echo "Next, navigate to Advanced Options > GL Driver > GL (Fake KMS)"
read -p "Press ENTER to open raspi-config"
sudo raspi-config

# Reboot
read -p "Next, we will reboot. After the reboot, please run install-2.sh. Press ENTER to reboot now."
sudo reboot
