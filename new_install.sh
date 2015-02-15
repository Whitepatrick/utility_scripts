#!/bin/bash

OUTPUT_PATH=/home/zaphod/output_files
DATE=$(date +"%Y%m%d%H%M")
FILENAME="$OUTPUT_PATH/install_output_$DATE.txt"

# colors
LGT_YLW="\e[93m"
GREEN="\e[32m"
RED="\e[91m"
DEFAULT="\e[0m"

PACKAGES="git guake terminator build-essential python-pip php5 ant apache2 audacious curl default-jdk default-jre	default-jre-headless docker.io flashplugin-installer fonts-inconsolata fonts-liberation gedit gedit-common gimp git-core gmusicbrowser gpodder graphite-carbon graphite-web rake nodejs openjdk-7-jdk openjdk-7-jre-headless openssh-client openssh-server openvpn p7zip php5 pidgin pithos playonlinux postgresql ruby sqlite3 statsd steam tcpdump tmux tomcat7-common ttf-mscorefonts-installer vim vlc wget wine winetricks libnotify-bin"
IFS=' ' read -a array <<< "$PACKAGES"

updateAndInstall() {
	./upgrade.sh

	echo "*********************************************************"
	echo -e "*$GREEN               Installing core packages$DEFAULT                *"
	echo "*********************************************************"

	apt-get install $PACKAGES -y
	
	chmod +rw $OUTPUT_PATH/install_output_*	

	echo
	echo "***********************************************************"
	echo -e "*$GREEN                   Great success!$DEFAULT                        *"
	echo "*       Please check output file for install details      *"
	echo "***********************************************************"
	notify-send "new_install.sh: Great success!"	
	exit 0
}

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
	echo -e "*$LGT_YLW This install is going to require a full terminal window$DEFAULT*"
	echo -e "*$LGT_YLW   so make sure you're in an actual terminal window. Be $DEFAULT*"
	echo -e "*$LGT_YLW prepared to enter in new login/password information for$DEFAULT*"
	echo -e "*$LGT_YLW a few things, in particular the new DB installs. Get a $DEFAULT*"
	echo -e "*$LGT_YLW   piece of paper so you can write down any important   $DEFAULT*"
	echo -e "*$LGT_YLW                  credentials.                          $DEFAULT*"
	echo "**********************************************************"
	echo
	echo -e "Are you using a full terminal window?$GREEN yes$DEFAULT or$RED no$DEFAULT: " 
	
	read answer

	if [ "$answer" == "y" ] || [ "$answer" == "yes" ] 
	then
		updateAndInstall
	else
		echo -e "$RED You goofed. Check the following:$DEFAULT"
		echo -e "1) $LGT_YLW run script with sudo permissions$DEFAULT"
		echo -e "2) $LGT_YLW run in full terminal window$DEFAULT"
		echo -e "3) $LGT_YLW answer question about term window correctly$DEFAULT"
		exit 1
	fi
}

checkForFullTerm




