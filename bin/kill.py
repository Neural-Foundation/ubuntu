#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# kill方式通常
# 应该发送15，等一两秒钟，
# 如果没效果，发送2，
# 如果还不行，发送1。
# 如果还不行，那你应该把那个程序删掉，
# 因为那个程序写的太烂了！
# http://www.linuxeden.com/html/news/20140210/148256.html
import sys
import time
from sh import ps, kill
from getpass import getuser
import logging
log = logging.getLogger()
logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.DEBUG)
log = logging.getLogger('kill')

def findId(id):
    list = ps('-u', getuser())
    for i in list.split('\n'):
        if i.strip().startswith(id + ' '):
            return True
    return False

def killId(id, num):
    kill('-%d'%num, id)

def main():
    if len(sys.argv) < 2:
        log.info('查看进程 ps -u %s'%getuser())
        print ps('-u', getuser())
    else:
        id = sys.argv[1]
        if not findId(id):
            log.warn('进程 [ %s ] 不存在'%id)
            return
        for i in [15, 2, 1]:
            if findId(id):
                log.info('进程 [ %s ] 存在，关闭 %d ...'%(id, i))
                killId(id, i)
                log.info('等待检查关闭结果')
                time.sleep(3)
            else:
                log.info('进程关闭成功.')
                return
        if findId(id):
            log.error('关闭失败,尝试使用kill 9 %s'%id)
        else:
            log.info('使用kill 1 成功.')

if __name__ == "__main__":
    main()
