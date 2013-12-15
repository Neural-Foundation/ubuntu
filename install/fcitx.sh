#! /bin/bash
#
# fcitx.sh
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#


sudo aptitude remove ibus
sudo aptitude remove fcitx*
sudo apt-get autoremove
sudo add-apt-repository ppa:fcitx-team/nightly
sudo apt-get update
sudo aptitude install -y fcitx-sogoupinyin 
im-switch -s fcitx -z default
sudo im-switch -s fcitx -z default
