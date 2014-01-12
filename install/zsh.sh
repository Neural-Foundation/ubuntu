#!/bin/bash
sudo aptitude install -y zsh
wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
ln -s /home/ender/work/ubuntu/zshrc ~/.zshrc
chsh -s /bin/zsh
