#!/usr/bin/env python2.7
# -*- coding: UTF-8 -*-
import sys, hashlib, bencode

def main():
    torrent_file = open(sys.argv[1], "rb")
    metainfo = bencode.bdecode(torrent_file.read())
    info = metainfo['info']
    print 'magnet:?xt=urn:sha1:'+hashlib.sha1(bencode.bencode(info)).hexdigest()

if __name__ == "__main__":
    main()
