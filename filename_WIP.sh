#!/bin/bash
PACKAGES=( "git guake terminator build-essential python-pip php5 ant apache2 audacious curl default-jdk default-jre	default-jre-headless docker.io flashplugin-installer fonts-inconsolata fonts-liberation gedit gedit-common gimp git-core gmusicbrowser gpodder graphite-carbon graphite-web rake nodejs openjdk-7-jdk openjdk-7-jre-headless openssh-client openssh-server openvpn p7zip php5 pidgin pithos playonlinux postgresql ruby sqlite3 statsd steam tcpdump tmux tomcat7-common ttf-mscorefonts-installer vim vlc wget wine winetricks libnotify-bin" )

for i in "${PACKAGES[@]}"
	echo $i
	dpkg -s $i | grep "install ok"
do
	
