#!/bin/bash
set -e  # exit on any error
# short version of http://www.howtoforge.com/vboxheadless-running-virtual-machines-with-virtualbox-4.1-on-a-headless-ubuntu-12.04-server
EXTENSION_PACK_URL='http://download.virtualbox.org/virtualbox/4.3.4/Oracle_VM_VirtualBox_Extension_Pack-4.3.4-91027.vbox-extpack'
echo 'deb http://download.virtualbox.org/virtualbox/debian precise contrib' | sudo tee --append /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get --no-install-recommends --yes install linux-headers-$(uname -r) build-essential dkms virtualbox-4.3
cd /tmp
wget $EXTENSION_PACK_URL
sudo VBoxManage extpack install $(basename $EXTENSION_PACK_URL)
sudo adduser `id -u` vboxusers

