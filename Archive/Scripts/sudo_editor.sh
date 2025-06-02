#!/usr/bin/env bash

# Check write permissions
# To sudoedit or not sudoedit, that is the question.
file=$1

if [ $# -ne 0 ] && [ ! $(test -f $file) ]
then
  touch $file
fi

if [ -w $file ]
then
  nvim $file
else
  sudoedit $file
fi

