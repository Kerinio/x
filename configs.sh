#!/bin/bash
# see https://github.com/felixhummel/configs
cd $HOME
git clone https://github.com/Kerinio/configs.git
cd configs
git submodule update --init
./init --force
source $HOME/.bashrc

