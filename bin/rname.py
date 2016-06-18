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
    n = name[0:2]+'.txt'
    shutil.move(f, n)

for p in os.listdir('.'):
    if os.path.splitext(p)[1] == '.txt':
        getCode(p)
