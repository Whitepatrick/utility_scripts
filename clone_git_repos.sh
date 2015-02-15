#!/bin/bash
# git_update.sh
# Patrick White

# Script to be executed by jenkins when a commit is made to master
# of my web repo. Will add functionality to be triggered when
# any repo has a commit to master

REPOS=( "work_ruby" "utility_scripts" "20eyes-web" "qa_bot" "sinatra_dev" "mag_libs" "scpeace" "freshzings" )

main() {	
	if [ $HOSTNAME == "hastur" ] || [ $USER == "zaphod" ]
	then
		echo "Hello $USER, lets begin"
		REPO_PATH=/home/zaphod/workspace
		echo "setting repo path variable as $REPO_PATH"
	else
		echo "Hello $USER, lets begin"
		REPO_PATH=/home/patrick/hound/data
		echo "setting repo path variable as $REPO_PATH"
	fi
dirCheck
}

dirCheck() {
	if [ ! -d "$REPO_PATH" ]
	then
  		mkdir workspace && cd workspace
	else
		cd $REPO_PATH
	fi
getRepos
}

getRepos() {
	for i in "${REPOS[@]}"
	do
		if [ ! -d "$i" ]
		then
			cd $REPO_PATH
			git clone http://github.com/whitepatrick/"$i".git
		else
			cd $i && git pull
		fi
	done
}

main

