#!/bin/bash
# pre ubuntu 12: git-core instead of git
set -e  # exit on any error
sudo apt-get --assume-yes build-dep git
sudo apt-get --assume-yes install libssl-dev xmlto
latest_git_version=$(curl -s http://git-scm.com/ | grep "class='version'" | perl -pe 's/.*?([0-9\.]+)<.*/$1/') && echo ${latest_git_version}
cd /tmp
wget -O git-${latest_git_version}.tar.gz https://github.com/git/git/tarball/v${latest_git_version}
tar xzf git-${latest_git_version}.tar.gz
cd git-git-*
sudo make prefix=/usr/local install install-doc

