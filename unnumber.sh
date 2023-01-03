#!/bin/bash

find . -d -maxdepth 1 -exec sh -c '
file=$(gsed -r "s/[0-9][0-9]_//" <<< "$1" | tr -d "\n")
mv "$1" "$file"' sh {} \;
