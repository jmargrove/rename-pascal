build: rename-pascal.sh number-dirs.sh find-replace.sh unnumber.sh
	shc -f rename-pascal.sh -o build/rename-pascal
	shc -f number-dirs.sh -o build/number-dirs
	shc -f find-replace.sh -o build/find-replace
	shc -f unnumber.sh -o build/unnumber

test: tests/test_unnumber.bats
	bats tests/test_unnumber.bats

