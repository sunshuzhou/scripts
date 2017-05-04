#!/usr/bin/env bash

# This script will do the following things:
#   1. download pbc-0.5.14, which may be not the latest version of pbc
#   2. enter pbc source directory and compile it

name=pbc-0.5.14.tar.gz
if ! [[ -e $name ]];then
  wget https://crypto.stanford.edu/pbc/files/$name
fi
tar zxf $name

cd pbc-0.5.14
./configure && make && make install
