#!/usr/bin/env zsh

# Split pwd into seperate dirs on '/'
split_pwd=("${(s|/|)$(pwd)}")
# Use current dir name as prefix
name=$split_pwd[-1]
# Number files
n=1
# List directory file per line
printf "Naming Wallpapers: %s\n" $name
for d in $(ls -1)
do
  # Split file name on '.'
  split_dir=("${(s|.|)d}")
  # Get last split for file extension
  extension=$split_dir[-1]
  # Rename
  mv $d "$name$n.$extension" 2> /dev/null
  # inc
  n=$(($n + 1)) 
done
ls -1
