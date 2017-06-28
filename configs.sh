#!/bin/bash
# see https://github.com/kerinio/configs
cd $HOME
git clone https://github.com/kerinio/configs.git
cd configs
git submodule update --init
./init --force
source $HOME/.bashrc

