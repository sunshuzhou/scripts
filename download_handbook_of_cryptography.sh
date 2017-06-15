#!/usr/bin/env bash
#
# Author: Sun Shuzhou <sunshuzhou@iie.ac.cn>
#   Date: 2017-05-10 16:18
#
# This script will do the following things:
#   download book from http://cacr.uwaterloo.ca/hac/
#

urls=(http://cacr.uwaterloo.ca/hac/about/toc3.pdf http://cacr.uwaterloo.ca/hac/about/chap1.pdf http://cacr.uwaterloo.ca/hac/about/chap2.pdf http://cacr.uwaterloo.ca/hac/about/chap3.pdf http://cacr.uwaterloo.ca/hac/about/chap4.pdf http://cacr.uwaterloo.ca/hac/about/chap5.pdf http://cacr.uwaterloo.ca/hac/about/chap6.pdf http://cacr.uwaterloo.ca/hac/about/chap7.pdf http://cacr.uwaterloo.ca/hac/about/chap8.pdf http://cacr.uwaterloo.ca/hac/about/chap9.pdf http://cacr.uwaterloo.ca/hac/about/chap10.pdf http://cacr.uwaterloo.ca/hac/about/chap11.pdf http://cacr.uwaterloo.ca/hac/about/chap12.pdf http://cacr.uwaterloo.ca/hac/about/chap13.pdf http://cacr.uwaterloo.ca/hac/about/chap14.pdf http://cacr.uwaterloo.ca/hac/about/chap15.pdf http://cacr.uwaterloo.ca/hac/about/appendix.pdf http://cacr.uwaterloo.ca/hac/about/references.pdf http://cacr.uwaterloo.ca/hac/about/index.pdf)

echo ${#urls}

for url in ${urls[@]}; do
  file=''
  if [[ $url =~ .*(/.*\.pdf) ]]; then
    file=.${BASH_REMATCH[1]}
    #echo $file
  fi
  if ! [[ -e $file ]]; then
    axel $url
  fi
done
