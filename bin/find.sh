#! /bin/bash
# 文件内容搜索


if [ ! "$1" ] ;then
	echo "请输入扩展文件名，例如: json"
fi
if [ ! "$2" ] ;then
	echo "请输入查找内容"
	exit
fi
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
purpleColour="\033[35m"

echo -e "查找扩展文件名: $purpleColour$1$endColour"
echo -e "查找内容: $redColour$2$endColour"
find ./ -name "*."$1 | xargs grep $2 --colour=auto
