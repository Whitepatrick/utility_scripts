#!/bin/bash
# new_install.sh
# Patrick White

# this script is a first step in creating some sort of "Fisher Price: Baby's first install script"
# contains a static list of packages I've been known to need/enjoy for various linux functions.
# By the end I'm sure you will realize, this is the first script I started using colored font!
# "if the args don't get you then the word count will" - The Cron-Mags

# WOULD BE NICE
## install git, then pull this repo, THEN run the rest of this script
#
## initialize PACKAGES as an array rather than a string, easier to use for output reasons
#
## create a globals file to accompany this file (and others I suppose) to act as a main config
## file for whatever sort of extensions I decide to add for new installs. config should probably
## be in XML or JSON -- move PACKAGES to this file


# declares some path variables, timestamp and an output file naming conventions.
# declared some color formats to make them a little easier to use and more human readable
# declare PACKAGES variable
initialize() {
OUTPUT_PATH=/home/zaphod/SB_WORK/utility_scripts/output_files
# time stuff for output file name
DATE=$(date +"%Y%m%d%H%M")
FILENAME="$OUTPUT_PATH/install_output_$DATE.txt"

# colors
LGT_YLW="\e[93m"
GREEN="\e[32m"
RED="\e[91m"
DEFAULT="\e[0m"

PACKAGES="git guake tilda terminator build-essential python-pip php5 ant apache2 audacious curl default-jdk default-jre	default-jre-headless docker.io flashplugin-installer fonts-inconsolata fonts-liberation gedit gedit-common gimp git-core gmusicbrowser gpodder graphite-carbon graphite-web rake nodejs openjdk-7-jdk openjdk-7-jre-headless openssh-client openssh-server openvpn p7zip php5 pidgin pithos playonlinux postgresql ruby sqlite3 steam tcpdump tmux tomcat7-common ttf-mscorefonts-installer vim vlc wget wine winetricks libnotify-bin"

# call next function in line 
checkForFullTerm
}

# calls upgrade script located adjacent to this script, then grabs the PACKAGES variable and 
# attempts to install it. Then throws a desktop notification for completion, Exits
# 
# this could definitely use some improvement to break it's dependency. 
updateAndInstall() {
	./upgrade.sh

	echo "*********************************************************"
	echo -e "*$GREEN               Installing core packages$DEFAULT                *"
	echo "*********************************************************"

	apt-get install $PACKAGES -y
	
#	chmod +rw $OUTPUT_PATH/install_output_*	

	echo
	echo "***********************************************************"
	echo -e "*$GREEN                   Great success!$DEFAULT                        *"
	echo "*       Please check output file for install details      *"
	echo "***********************************************************"
	notify-send "new_install.sh: Great success!"	
	exit 0
}

# informs the user of the necessisity of this script being launched in a full term window.
# informs of sudo req as well, handles input error.
checkForFullTerm() {
	clear
	echo "**********************************************************"	
	echo -e "*$RED                  !!!!IMPORTANT!!!!                     $DEFAULT*"
	echo -e "*$RED This script must be ran with sudo permissions to work. $DEFAULT*"
	echo -e "*$RED  If you're not running it like 'sudo ./new_install.sh' $DEFAULT*"
	echo -e "*$RED                 then it will fail.                     $DEFAULT*"
	echo "**********************************************************"
	echo
	echo
	echo
	echo "**********************************************************"
	echo "* This install is going to require a full terminal window*"
	echo "*   so make sure you're in an actual terminal window. Be *"
	echo "* prepared to enter in new login/password information for*"
	echo "* a few things, in particular the new DB installs. Get a *"
	echo "*   piece of paper so you can write down any important   *"
	echo "*                  credentials.                          *"
	echo "**********************************************************"
	echo
	echo -e "Are you using a full terminal window?$GREEN yes$DEFAULT or$RED no$DEFAULT: " 
	
	read answer

	if [ "$answer" == "y" ] || [ "$answer" == "yes" ] 
	then
		# if condition is met, calls last function in line
		updateAndInstall
	else 
		echo -e "$RED You goofed. Check the following:$DEFAULT"
		echo "1) run script with sudo permissions"
		echo "2) run in full terminal window"
		echo "3) answer question about term window correctly"
		exit 1
	fi
}

#calls first function in line
initialize




