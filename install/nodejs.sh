#! /bin/bash
#
# node.js
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#
# ssl开发
sudo apt-get install openssl -f
sudo apt-get install libssl-dev -f
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
npm install -g cnpm --registry=https://registry.npm.taobao.org
cnpm install -g phantomjs-prebuilt
