#!/bin/bash
# pull.sh
# Patrick White

# Script iterates through array of hg repo
# names and pulls & updates changes made
# to working branch. 

# Add later: add parameter to use for any
# repo/branch 

export HG_ROOT=/home/tomcat/hgwork
cd $HG_ROOT
# assign repo dirs to an array
REPOS=( "qa_scripts" )

# iterate through dirs and pull
for i in "${REPOS[@]}"
do
        cd $i && hg pull && hg up -C; cd ../
done
