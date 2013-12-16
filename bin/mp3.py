#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
for path in os.listdir('.'):
  os.system('lame -f %s %s.wav'%(path,path[:path.rfind('.')]))
