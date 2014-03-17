#!/bin/bash
# django 使用south插件后的自动升级
if [ $# -eq  0 ]; then 
    echo '请输入需要脚本迁移的项目名称'
    echo '例如: south.sh taobao'
else
    ./manage.py schemamigration $1 --auto
    ./manage.py migrate $1
fi
