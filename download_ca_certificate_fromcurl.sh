#!/usr/bin/env bash
#
# Author: Sun Shuzhou <sunshuzhou@iie.ac.cn>
#   Date: 2017-05-14 19:43
#
# This script will do the following things:
#   download CA certificates from https://curl.haxx.se/docs/caextract.html
#


#axel https://curl.haxx.se/ca/cacert-2016-01-20.pem
#axel https://curl.haxx.se/ca/cacert-2016-04-20.pem
#axel https://curl.haxx.se/ca/cacert-2016-09-07.pem
#axel https://curl.haxx.se/ca/cacert-2016-09-14.pem
#axel https://curl.haxx.se/ca/cacert-2016-11-02.pem
#axel https://curl.haxx.se/ca/cacert-2017-01-18.pem


files=`ls *.pem`

for file in $files; do
  count=$(grep 'BEGIN CERTIFICATE' $file | wc -l)
  echo $file:$count
done
