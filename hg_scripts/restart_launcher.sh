#!/bin/bash
# restarts the launcher
#	shutdown voodooCacheServer
#	kill tomcat
#	start tomcat
#	start voodooCacheServer
# By: Patrick White
clear

echo "hey there, $USER! I'm going to restart the launcher now!"

cd ~
sh /home/tomcat/wrapper/voodooCacheServer stop
pkill -9 -f bootstrap
startup.sh
sh /home/tomcat/wrapper/voodooCacheServer start

echo "there we go, have a great day launching stuff!"
