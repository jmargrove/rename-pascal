build: src/rename-pascal.sh src/number-dirs.sh src/find-replace.sh src/unnumber.sh
	shc -f src/rename-pascal.sh -o build/rename-pascal
	shc -f src/number-dirs.sh -o build/number-dirs
	shc -f src/find-replace.sh -o build/find-replace
	shc -f src/unnumber.sh -o build/unnumber

