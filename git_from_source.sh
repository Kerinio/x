#!/bin/bash
# pre ubuntu 12: git-core instead of git
set -e  # exit on any error
sudo apt-get --assume-yes build-dep git
sudo apt-get --assume-yes install libssl-dev xmlto
latest_git_version=$(curl -s https://api.github.com/repos/git/git/tags | perl -ne 'print "$1\n" if /name": "(v.*)"/' | sort | tail -n1) && echo ${latest_git_version}
cd /tmp
wget -O git-${latest_git_version}.tar.gz https://github.com/git/git/tarball/${latest_git_version}
tar xzf git-${latest_git_version}.tar.gz
cd git-git-*
sudo make prefix=/usr/local install install-doc

