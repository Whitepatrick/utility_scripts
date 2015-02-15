#!/bin/bash
# git_update.sh
# Patrick White

# Script to be executed by jenkins when a commit is made to master
# of my web repo. Will add functionality to be triggered when
# any repo has a commit to master

# colors
init() {
LGT_YLW="\e[93m"
GREEN="\e[32m"
RED="\e[91m"
DEFAULT="\e[0m"

REPOS=( "work_ruby" "utility_scripts" "20eyes-web" "qa_bot" "sinatra_dev" "mag_libs" "scpeace" "freshzings" )
WORK_ROOT=/home/zaphod/workspace

	if [ $HOSTNAME == "hastur" ] || [ $USER == "zaphod" ]; then
		echo "Hello $USER, lets begin"
		REPO_PATH=/home/zaphod/workspace
		echo "setting repo path variable as $REPO_PATH"
	else
		echo "Hello $USER, lets begin"
		REPO_PATH=/home/patrick/hound/data
		echo "setting repo path variable as $REPO_PATH"
	fi
}
dirCheck() {
	if [[ ! -d "$REPO_PATH" ]]; then
  		mkdir $REPO_PATH && cd $REPO_PATH
	else
		cd $REPO_PATH		
	fi
getRepos
}

getRepos() {
	for repo in "${REPOS[@]}"
	do
		echo -e "$GREEN $repo $DEFAULT"
		echo "---------------"
		echo
		if [[ ! -d $repo ]]; then
			git clone http://github.com/whitepatrick/$repo.git
		else
			cd $repo && git pull; cd ..
		fi
		echo

	done
}

init
dirCheck


