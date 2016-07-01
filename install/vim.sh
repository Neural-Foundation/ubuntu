#!/bin/bash
sudo aptitude install -y vim ctags
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
ln -s /home/ender/work/ubunt/vim/.vimrc.local /home/ender
ln -s /home/ender/work/ubunt/vim/.vimrc.bundles.local /home/ender
ln -s /home/ender/work/ubunt/vim/.vimrc.before.local /home/ender
vim
