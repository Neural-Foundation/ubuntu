#!/bin/bash
sudo aptitude install -y vim
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
ln -s /home/ender/work/ubuntu/vimrc ~/.vimrc
vim
