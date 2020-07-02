#!/bin/sh
# ping every 10 seconds until the ip/Host is on-line and execute the app

# to hide ping results
# ping -oc 100000 -i10 Hostname > /dev/null && /path/to/script.sh 

ping -oc 100000 -i10 10.0.0.11 && open vnc://user:password@10.0.0.149
