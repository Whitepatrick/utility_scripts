#!/bin/bash

PATH=$PATH:~/SB_WORK/hg_test/hg_test/
BRANCH_ARG=${1^^}
CHECKOUT="cd $PATH && hg checkout $BRANCH_ARG"

safeRunCommand() {
typeset cmnd="$1"
typeset ret_code

echo cmnd=$cmnd
eval $cmnd
ret_code=$?
if [ $ret_code != 0 ]; then
  printf "Error : [%d] when executing command: '$cmnd'" $ret_code
  exit $ret_code
fi
}

#command="sl -l | grep p"
safeRunCommand "$CHECKOUT"
