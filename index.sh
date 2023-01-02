#!/bin/bash 
flag_w=false
flag_f=false
flag_d=false

# Parse command-line options
while getopts "fdw" opt; do
  case $opt in
    w)
      # Flag for a wet run - default is for dry
      flag_w=true
      ;;
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
  esac
done


# sed_cmd='file=$((echo $1 | gsed -r "s/(\/)(.)/\1\U\2/g" | gsed -r "s/(^|-|_|\s)([a-z0-9])/\U\2/g" | gsed -r "s/\s//g") | tr -d "\n") \ echo "$1" "$file"'

wet_sed_cmd='file=$((echo $1 | gsed -r "s/(\/)(.)/\1\U\2/g" | gsed -r "s/(^|-|_|\s)([a-z0-9])/\U\2/g" | gsed -r "s/\s//g") | tr -d "\n")
mv "$1" "$file"'

dry_sed_cmd='file=$((echo $1 | gsed -r "s/(\/)(.)/\1\U\2/g" | gsed -r "s/(^|-|_|\s)([a-z0-9])/\U\2/g" | gsed -r "s/\s//g") | tr -d "\n")
echo "$1" "$file"'

# Rename all files and directories under the current directory to PascalCase
if [[ "$flag_w" = true && "$flag_d" = true ]]; then
  # Run the script on the files
  echo "Dirs renaming..."
  find . -type f -exec sh -c "$wet_sed_cmd" sh {} \;
elif [[ "$flag_w" = true && "$flag_f" = true ]]; then
  # Run the script on the directories
  echo "Files renaming..."
  find . -type f -exec sh -c "$wet_sed_cmd" sh {} \;
elif [[ "$flag_w" = false && "$flag_f" = true ]]; then
  # Run the script on the directories
  echo "Files testing..."
  find . -type f -exec sh -c "$dry_sed_cmd" sh {} \;
elif [[ "$flag_w" = false && "$flag_d" = true ]]; then
  # Run the script on the directories
  echo "Dirs testing..."
  find . -type d -exec sh -c "$dry_sed_cmd" sh {} \;
else 
  # Flag is not present
  echo "Flag is not present."
fi
