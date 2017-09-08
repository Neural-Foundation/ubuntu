#! /bin/bash
# 文件内容搜索

echo '查找扩展文件名:'$1
echo '查找内容:'$2
find ./ -name '*.'$1 | xargs grep $2 --colour
