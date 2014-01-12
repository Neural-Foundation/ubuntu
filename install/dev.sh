#! /bin/bash
#
# dev.sh
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#
sudo aptitude install -y subversion vim-gnome
ln -s /home/ender/work/ubuntu/gitconfig ~/.gitconfig
ln -s /home/ender/work/ubuntu/gitignore ~/.gitignore
sudo aptitude install -y build-essential linux-headers-`uname -r`
