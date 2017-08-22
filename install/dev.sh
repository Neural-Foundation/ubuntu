#! /bin/bash
#
# dev.sh
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#
sudo apt install -y vim-gnome
ln -s /home/ender/work/ubuntu/gitconfig ~/.gitconfig
ln -s /home/ender/work/ubuntu/gitignore ~/.gitignore
sudo apt install -y build-essential linux-headers-`uname -r`

sudo apt install -y ctags
