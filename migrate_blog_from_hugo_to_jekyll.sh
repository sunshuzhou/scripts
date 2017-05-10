#!/usr/bin/env bash

# This script will try to migrate my previous posts on hugo to jekyll.


# Get hugo posts

files=`ls [^2]*.md`
while read f; do
  echo Migrating [${f}]...
  d=`sed -n 2p $f`
  if [[ $d =~ ([1234567890-]+) ]]; then
    d=${BASH_REMATCH[1]}
    mv $f "${d}-${f}"
  else
    echo Error with $d 1>&2
  fi
done <<< $files
