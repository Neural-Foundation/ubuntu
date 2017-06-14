#! /bin/bash
#
# font.sh
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#


# cd /tmp
# wget http://www.intellij.org.cn/downloads/YaHei.Consolas.1.12.zip

# clone
git clone https://github.com/powerline/fonts.git
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
