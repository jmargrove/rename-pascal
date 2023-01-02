#!/bin/bash 

# Parse command-line options
while getopts ":d" opt; do
  case $opt in
    f)
      # Flag -f is present
      flag_f=true
      ;;
    d)
      #flag -d is present
      flag_d=true
      ;;
    \?)
      # Invalid option
      echo "Invalid option: $OPTARG" >&2
      exit 1
      ;;
    :)
      # Option requires an argument
      echo "Optioin -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

sed_cmd='file=$((echo $1 | gsed -r "s/(\/)(.)/\1\U\2/g" | gsed -r "s/(^|-|_|\s)([a-z0-9])/\U\2/g" | gsed -r "s/\s//g") | tr -d "\n")
  mv "$1" "$file"
'
# Rename all files and directories under the current directory to PascalCase
if [ "$flag_d"  = true ]; then
  # Run the script on the files
  find . -type f -exec sh -c $sed_cmd sh {} \;
if else [ "$flag_f" = true ]; then
  # Run the script on the directories
  find . -type d -exec sh -c $sed_cmd sh {} \;
else 
  # Flag is not present
  echo "Flag is not present."
fi
