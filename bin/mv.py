#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2016 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#from sh import ls
import os, shutil

def getCode(f):
    name = os.path.split(f)[-1]
    s = name.find('[')
    e = name.find(']')
    z = name[s+1:e]
    n = 0
    for i in bytearray(z):
        n+=i
    code = str(n%10)
    if not os.path.exists(code):
        os.makedirs(code)
    shutil.move(f, code)

for p in os.listdir('.'):
    if os.path.splitext(p)[1] in ['.zip', '.tar']:
        getCode(p)
