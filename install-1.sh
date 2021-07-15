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

# ddclient setup
wget https://github.com/ddclient/ddclient/archive/refs/tags/v3.9.1.tar.gz
tar -xvf v3.9.1.tar.gz
./configure \
    --prefix=/usr \
    --sysconfdir=/etc/ddclient \
    --localstatedir=/var
make
make VERBOSE=1 check
sudo make install
cp sample-etc_systemd.service /etc/systemd/system/ddclient.service
systemctl enable ddclient.service
service ddclient start
sudo cp conf/ddclient.conf /etc/ddclient.conf

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
