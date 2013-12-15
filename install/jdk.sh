#!/bin/bash
# 安装JDK1.7
# 增加软件仓库
sudo add-apt-repository ppa:webupd8team/java
# jdk7安装器
sudo apt-get update && sudo apt-get install oracle-jdk7-installer
# 设置默认JVM选择
sudo update-alternatives --display java
# 选择JVM
sudo update-alternatives --config java
