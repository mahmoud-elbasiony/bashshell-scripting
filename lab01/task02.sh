#!/bin/bash
####script to be executed every 1 min to monitor system load, and add it to file /var/log/system-load. The script must be run using root.
#Exit codes
#	0 : normal termination
#       1 : script not running by root
#	2 : log file not exits

[ $(/usr/bin/id -u) -ne 0 ] && echo "script must run using root" && exit 1
[ ! -f log ] && echo "log file is missing" && exit 2
FLAG=true
while [ FLAG ]
do
[ $(uptime >> /var/log/system-load) ]
echo "logging....."
sleep 1m

done

exit 0
