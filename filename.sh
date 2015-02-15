#!/bin/bash

setPath() {	
	if [ $HOSTNAME == "hastur"] || [ $USER == "zaphod" ]
	then
		echo "Hello $USER, lets begin"
		REPO_PATH=/home/zaphod/workspace
		echo "setting repo path variable as $REPO_PATH"
	else
		echo "Hello $USER, lets begin"
		REPO_PATH=/home/patrick/hound/data
		echo "setting repo path variable as $REPO_PATH"
	fi
}

setPath

if [ ! -d "$REPO_PATH" ]; then
  	echo "repo path not there"
else
	echo "repo path exists"
fi
