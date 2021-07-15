#!/bin/bash
# Prerequisites
sudo snap install core
sudo snap install gnome-system-monitor
cp conf/Resource\ Monitor.desktop ~/Desktop/.

sudo apt-get install libglu1-mesa htop ddclient
wget https://felenasoft.com/xeoma/downloads/latest/linux/xeoma_linux_arm7.tgz
tar -xvf xeoma_linux_arm7.tgz
./xeoma.app -install -coreauto
