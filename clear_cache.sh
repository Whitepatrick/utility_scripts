#!/bin/bash
# clear_cache.sh
# script to clear the cache/temp/work folder before
# an alquemie build. 

FOLDER_PATH=/home/pwhite/testing
DIRS=( 'work' 'temp' 'cache')

for repo in "${REPOS[@]}"

removeFiles() {
	for i in "$DIRS[@]"
	do
		# echo "Removing $i files"
		cd $FOLDER_PATH/$i && rm *
		echo "Files removed from" $i
	done
}

remove_files
