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

# inadyn setup
wget https://launchpad.net/~t.c/+archive/ubuntu/inadyn/+files/inadyn_2.3.1-2-bionic1_armhf.deb
sudo dpkg -i inadyn_2.3.1-2-bionic1_armhf.deb
sudo apt-get -f install
rm inadyn_2.3.1-2-bionic1_armhf.deb

# Prompt for username/password
echo "Enter your Google Domain DDNS Username:"
read DDNSUSER
echo "Enter your Google Domain DDNS Password:"
read DDNSPASS

# Replace user/pass in conf file
cp conf/inadyn.conf conf/temp.conf
sed -i "s/USER_NAME/$DDNSUSER/g" conf/temp.conf
sed -i "s/PASS_WORD/$DDNSPASS/g" conf/temp.conf

# Move configuration
sudo mv conf/temp.conf /etc/inadyn.conf

# Verify config
inadyn --check-config

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
