#! /bin/bash
#
# jdk.sh 
# Copyright (C) 2013 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#
# 安装JDK1.8
# 增加软件仓库
sudo add-apt-repository ppa:webupd8team/java
# jdk8安装器
sudo apt update && sudo apt install oracle-jdk8-installer
# 设置默认JVM选择
sudo update-alternatives --display java
# 选择JVM
sudo update-alternatives --config java
