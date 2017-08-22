#! /bin/bash
#
# py.sh
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#


sudo apt install -y ipython
sudo apt install -y python-pip
sudo pip install bencode
sudo pip install watchdog
sudo pip install sh
sudo pip install pyquery
sudo pip install path.py
sudo pip install Django
sudo pip install south
sudo pip install ipdb
# Postgresql
sudo pip install psycopy2
#sudo pip install stratum
#sudo pip install pelican
# 压缩js
#sudo pip install slimit
# 压缩html css
#sudo pip install slimmer

# 代码格式化
sudo apt install python-autopep8
