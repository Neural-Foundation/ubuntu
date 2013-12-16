#! /bin/bash
#
# dropbox.sh 
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
