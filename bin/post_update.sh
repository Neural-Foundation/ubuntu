#! /bin/bash
#
# post_update.sh
# Copyright (C) 2014 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#


echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING --src 0/0 --dst 192.168.1.235 -p tcp --dport 80 -j REDIRECT --to-port 8080
iptables -t nat -I OUTPUT  --src 0/0 --dst 192.168.1.235 -p tcp --dport 80 -j REDIRECT --to-ports 8080
