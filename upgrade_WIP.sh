#!/bin/bash

DEFAULT="\e[0m"
GREEN="\e[32m"

echo "*********************************************************"
echo -e "*$GREEN            updating and upgrading install$DEFAULT             *"
echo "*********************************************************"

apt-get update && apt-get upgrade -y

