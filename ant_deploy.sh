#!/bin/bash

PATH=$PATH:/home/zaphod/SB_WORK/hg_test/hg_test/
BRANCH_ARG=${1^^}
CHECKOUT="cd $PATH && hg checkout $BRANCH_ARG"

emptyCheck() {
if [[ -z "$BRANCH_ARG" ]]
then
	echo 'empty branch name'
else
	echo 'Hello,' $USER'! Building '$BRANCH_ARG 'on' $HOSTNAME
fi
}

testBranch() {
eval $CHECKOUT
$CHECKOUT=$?
if [ $CHECKOUT != 0 ]
	printf "Bad Mercurial Branch: Checkout returns error"
	exit $CHECKOUT
fi
}

BRANCH=emptyCheck "$BRANCH_ARG"
echo $BRANCH
testBranch "$BRANCH"



## WEB SERVER / UTIL SERVER ##
#source .bash_profile ; cd /home/tomcat/hgwork/main && ant hg-deploy-releasetag -Dreleasetag=$BRANCH_NAME

## LAUNCHER / VOODOOSIM ##
#source .bash_profile ; cd /home/tomcat/hgwork/main && ant hg-deploy-releasetag-specific -Dwebapps=m,wrapper -Dreleasetag=$BRANCH_NAME
