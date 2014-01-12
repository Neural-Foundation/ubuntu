#!/bin/sh

case ${1##*.tar.} in
    bz2)
	tar jxvf $1
	;;
    gz)
	tar zxvf $1
	;;
    *)
	echo "错误的文件类型"
esac
