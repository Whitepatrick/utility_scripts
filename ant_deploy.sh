#!/bin/bash
#ant_deploy.sh
#pwhite

## This script takes one argument, a mercurial branch name that
## is located in the hgwork/main repo. It validates that the 
## branch exists, handles missing arguments, and deploys the branch 
## to the appropriate server based on where the script is being
## executed from. If the branch name doesn't exist or the branch
## name isn't passed to the script, it fails and exits. Meant to 
## make rundeck a little faster, and more flexible.

## sets command line argument and makes it uppercase
BRANCH_ARG=${1^^}


## checks to see if the user supplied an argument and passes to
## testBranch. If argument is empty, exits.
emptyCheck() {
if [ -z "$BRANCH_ARG" ]
then
	echo "Missing branch argument, please run script with branch name"
	echo "Example: "$> ./ant_deploy AD-1234" 1>&2
	exit 1
else
	echo "Hello," $USER"! It looks like you're trying to build" $BRANCH_ARG "on" $HOSTNAME
	echo "First lets double check that branch exists:"
	testBranch "$BRANCH_ARG"
fi
}

## checks to see if this branch exists in the main mercurial repo and 
## passes to deployTagger. If branch isn't valid, exits.
testBranch() {
if cd ~/hgwork/main && hg checkout $BRANCH_ARG
then
	echo "Great News! That branch DOES exist"
	echo "Now lets figure out what kind of deploy you should get"
	deployTagger
else
	echo "Thats a bad branch tag, Oops!"
	echo "Double check you're inputing a valid branch name for the main repo"
fi
}

## looks at the hostname of the node executing this script and makes a
## decision on which release tags to deploy with supplied branch
deployTagger() {
case "$HOSTNAME" in 

## Check if this is a web or util server and deploy
	*web*|*left*|*right*|*util*)
		echo "Deploying" $BRANCH_ARG "to" $HOSTNAME
		cd /home/tomcat/hgwork/main && ant hg-deploy-releasetag -Dreleasetag=$BRANCH_ARG
	;;
## Check if this is a launcher or voodoosim and deploy
	*launch*|*sim*)
		echo "Deploying" $BRANCH_ARG "to" $HOSTNAME
		cd /home/tomcat/hgwork/main && ant hg-deploy-releasetag-specific -Dwebapps=m,wrapper -Dreleasetag=$BRANCH_ARG
	;;
esac
}

## start
emptyCheck "$BRANCH_ARG"


## WEB SERVER / UTIL SERVER ##
#source .bash_profile ; cd /home/tomcat/hgwork/main && ant hg-deploy-releasetag -Dreleasetag=$BRANCH_NAME

## LAUNCHER / VOODOOSIM ##
#source .bash_profile ; cd /home/tomcat/hgwork/main && ant hg-deploy-releasetag-specific -Dwebapps=m,wrapper -Dreleasetag=$BRANCH_NAME
