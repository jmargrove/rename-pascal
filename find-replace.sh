#!/bin/bash

# Find all files in the current directory
files=$(find . -type f -maxdepth 1)

old=$1
new=$2
echo "${old} >>> ${new}"

# Iterate over the files and replace the string
for file in $files
do
  gsed -i "s/${old}/${new}/g" "${file}"
done

