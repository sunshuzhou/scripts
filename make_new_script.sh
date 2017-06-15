#!/usr/bin/env bash
#
# Author: Sun Shuzhou <sunshuzhou@iie.ac.cn>
#   Date: 2017-05-10 16:03
#
# This script will do the following things:
#    make a new script based on template.sh
#    put the new script in scripts project
#    link the new script in the current working directory
#

if [[ -z $1 ]]; then
  echo -e "Usage:
  $0 filename"
  exit
fi

dir=`dirname $0`
#echo $dir
template=`cat $dir/template.sh`
#echo "$template"
datetime=$(date "+%Y-%m-%d %H:%M")

if [[ -e $dir/$1 ]]; then
  echo "$dir/$1 exists."
  exit 1
fi

echo "$template" | sed "s/time/$datetime/" 2>/dev/null >$dir/$1

chmod +x $dir/$1
if [[ -e ./$1 ]]; then
  echo ./$1 exists. 1>&2
else
  ln -s $dir/$1 .
fi

