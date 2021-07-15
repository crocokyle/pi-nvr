#!/bin/bash
# Prerequisites
sudo snap install core
sudo snap install gnome-system-monitor
sudo apt-get install libglu1-mesa htop 
wget https://felenasoft.com/xeoma/downloads/latest/linux/xeoma_linux_arm7.tgz
tar -xvf xeoma_linux_arm7.tgz
./xeoma.app -install -coreauto
