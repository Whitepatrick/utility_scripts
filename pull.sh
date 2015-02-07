#!/bin/bash
# pull.sh
# Patrick White

# Script to be executed by jenkins when a commit is made to master
# of my web repo. Will add functionality to be triggered when
# any repo has a commit to master

cd /home/patrick/hound/data

# assign repo dirs to an array
GITS=( "work_ruby" "utility_scripts" "20eyes-web" "qa_bot" )

# iterate through dirs and pull
for i in "${GITS[@]}"
do
        cd $i && git pull ; cd ../
done
