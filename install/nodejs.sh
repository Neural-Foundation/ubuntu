#! /bin/bash
#
# node.js
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#
# curl
sudo apt-get install curl
# ssl开发
sudo apt-get install openssl
sudo apt-get install libssl-dev
# 安装nvm选择node版本
git clone git://github.com/creationix/nvm.git ~/.nvm
#echo ". ~/.nvm/nvm.sh" >> ~/.zshrc
~/.nvm/nvm.sh
nvm install v0.10.23
# 设置默认版本
nvm alias default v0.10.23
# 任务管理 grunt
npm i -g grunt-cli
# coffee
npm i -g coffee-script
# bower
npm i -g bower
