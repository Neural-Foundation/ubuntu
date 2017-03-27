#! /bin/bash
#
# go.sh
# Copyright (C) 2014 ender xu <xuender@gmail.com>
#
# Distributed under terms of the MIT license.
#


bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

go get -u github.com/jstemmer/gotags
go get -u github.com/golang/lint/golint
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/nsf/gocode
go get -u github.com/rogpeppe/godef
