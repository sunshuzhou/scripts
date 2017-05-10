#!/usr/bin/env bash
#
# Author: Sun Shuzhou <sunshuzhou@iie.ac.cn>
#   Date: 2017-05-10 16:03
#
# This script will do the following things:
#    make a new script based on template.sh
#

template=`cat template.sh`
#echo "$template"
datetime=$(date "+%Y-%m-%d %H:%M")

echo "$template" | sed "s/time/$datetime/" 
