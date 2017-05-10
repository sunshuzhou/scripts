#!/usr/bin/env bash

# This script will do the following things:
#   1. download charm from github
#   2. compile it in Mac OSX

git clone https://github.com/JHUISI/charm.git
cd charm
./configure.sh --enable-darwin
make install && make test
