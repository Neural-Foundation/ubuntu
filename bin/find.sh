#! /bin/bash
# 文件内容搜索


if [ ! "$1" ] ;then
	echo "请输入扩展文件名，例如: json"
fi
if [ ! "$2" ] ;then
	echo "请输入查找内容"
	exit
fi

echo -e "查找扩展文件名: \033[35m"$1"\033[0m"
echo -e "查找内容: \033[31m"$2"\033[0m"
find ./ -name "*."$1 | xargs grep $2 --colour
