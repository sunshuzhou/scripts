#!/usr/bin/env bash
#
# Author: Sun Shuzhou <sunshuzhou@iie.ac.cn>
#   Date: 2017-05-11 15:52
#
# This script will do the following things:
#    generate new blog template with date and title
#

datetime=$(date "+%Y-%m-%d %H:%M")
title=$1
file=$POST_DIR/$(date +%Y-%m-%d)-$title.md

if [[ -z $title ]]; then
  echo -e "Usage:
$0 title" >&2
  exit 1
fi

if [[ -e $file ]]; then
  echo "$file exists." >&2
  exit 1
fi

echo -e '---

layout : post' >&$file
echo date : "$datetime" >> $file
echo title : "$title" >> $file
echo >> $file
echo --- >> $file

