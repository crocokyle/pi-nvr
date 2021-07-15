#!/bin/bash
# Prerequisites
sudo snap install core
sudo snap install gnome-system-monitor
sudo apt-get install libglu1-mesa htop 
wget https://felenasoft.com/xeoma/downloads/latest/linux/xeoma_linux_arm7.tgz
tar -xvf xeoma_linux_arm7.tgz
./xeoma.app -install -coreauto
echo ""
echo "Complete!"
echo "Please update OpenGL drivers to prevent CPU issues"
echo "Start by running 8 Update"
echo "Next, navigate to Advanced Options > GL Driver > GL (Fake KMS)"
read -p "Press ENTER to open raspi-config"
sudo raspi-config
echo ""
echo "Please reboot your pi before running the next install script"
