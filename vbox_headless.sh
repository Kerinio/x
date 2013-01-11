#!/bin/bash
# short version of http://www.howtoforge.com/vboxheadless-running-virtual-machines-with-virtualbox-4.1-on-a-headless-ubuntu-12.04-server
EXTENSION_PACK_URL='http://download.virtualbox.org/virtualbox/4.2.6/Oracle_VM_VirtualBox_Extension_Pack-4.2.6-82870.vbox-extpack'
echo 'deb http://download.virtualbox.org/virtualbox/debian precise contrib' | sudo tee --append /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install linux-headers-$(uname -r) build-essential dkms virtualbox
cd /tmp
wget $EXTENSION_PACK_URL
sudo VBoxManage extpack install $(basename $EXTENSION_PACK_URL)
sudo adduser `id -u` vboxusers

