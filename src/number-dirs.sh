#!/bin/bash

# Store the current working directory
cwd=$(pwd)

# Change to the directory containing the directories to be renamed
cd "${cwd}/${$1}"

# Get a list of all directories in the current directory
dirs=$(ls -d */)

# Initialize a counter variable
count=0

# Loop through the list of directories
for dir in $dirs; do
  # Increment the counter
  count=$((count+1))
  # Pad the counter with leading zeros to get a fixed width of 2 digits
  padded_count=$(printf "%02d" $count)
  # Rename the directory
  mv "$dir" "${padded_count}_${dir}"
done

# Change back to the original working directory
cd "$cwd"




