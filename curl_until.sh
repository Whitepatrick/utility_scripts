#!/bin/bash
# curl_web_servers.sh
# By: Patrick White

# runs a command to curl the webservers until
# they there is a response. Will delay the finish
# of the build but as soon as it's complete you 
# will know alchemy is ready to test

# declare webserver by environment
QA_WEB="http://alquemie.qa.smartbrief.com" # QA
PQA_WEB="http://alquemie.projectqa.smartbrief.com" # Project QA
PQA2_WEB="http://alquemie.projectqa2.smartbrief.com" # Project QA 2

until $(curl --output /dev/null --silent --head --fail ${QA_WEB}); do
	printf '.'
	sleep 5
done
echo "ALL YOUR ALCHEMY ARE BELONG TO US"
