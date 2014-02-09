#!/bin/bash
# install command line tools I need on any machine

sudo apt-get update

# looks creepy, but easier to add/remove packages
echo 'vim
bash-completion
wajig
python-optcomplete
gpm
htop
curl
iotop
atool
lftp
inotify-tools
dnsutils
lsof
whois
jnettop
rsync
tree
' | sudo xargs -P 1 apt-get --yes install 

