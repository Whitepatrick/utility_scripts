#!/bin/bash
# git_update.sh
# Patrick White

# this script looks for a set of repos and reacts based on their availability
# if the git repo isn't located where it looks, it will clone it.
# if the git repo exists, it will pull it.
# "may this script be a light for you, in dark times" - Lady of the Lightppd

# WOULD BE NICE
## pass github username and specific repos to clone/pull
#
## break dependence on hard links and base path variables on assumptions


# declares variables, initializes REPOS array with set of github
# repos, decides path on environment and user
initialize() {
# output colors
LGT_YLW="\e[93m"
GREEN="\e[32m"
RED="\e[91m"
DEFAULT="\e[0m"
# array cotaining github repositories for user whitepatrick
REPOS=( "work_ruby" "utility_scripts" "20eyes-web" "qa_bot" "sinatra_dev" "mag_libs" "scpeace" "freshzings" "xmpp4r-robot" "gnudism_bot" )
# set repo path with conditions
if [ $HOSTNAME == "hastur" ] || [ $USER == "zaphod" ]; then
	REPO_PATH=/home/zaphod/workspace
else
	REPO_PATH=/home/patrick/hound/data
fi

echo "Hello $USER, lets begin"
echo "setting repo path variable as $REPO_PATH"
# call next function in line
dirCheck
}

# check if repo path exists. If it isn't there this creates it
# otherwise it moves over to the repo path and begins the main
# function of this script
dirCheck() {
	if [[ ! -d "$REPO_PATH" ]]; then
  		mkdir $REPO_PATH && cd $REPO_PATH
	else
		cd $REPO_PATH		
	fi
# call next and last function in line
getRepos
}

# main function of script, checks if github repo exits, if it
# does, script moves in to repo dir and pulls recent change set.
# if it does not exist it clones directory from github.com
getRepos() {
	for repo in "${REPOS[@]}"
	do
		echo "-------------------------------"		
		echo -e "GitHub Repo: [$GREEN$repo$DEFAULT]"
		echo "-------------------------------"
		echo
		if [[ ! -d $repo ]]; then
			# clone
			git clone http://github.com/whitepatrick/$repo.git
		else
			# pull
			cd $repo && git pull; cd ..
		fi
		echo

	done
	exit 0
}

# calls first function in line
initialize

