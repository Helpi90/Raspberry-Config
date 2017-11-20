#!/bin/bash
#======================================== ==================================
#     FILE:             wificheck_reboot.sh
#     AUTHOR:           Helpi_Stone
#     EMAIL:            helpi9007@gmail.com
#     CREATED:          2017-11-19
#
#     MODIFIED BY:      Helpi_Stone
#     MODIFIED DATE:    2017-11-19
#
#     DESCRIPTION:      "Beschreibung"
#
#     VERSION:           1.0
# Run Every 5 mins - Seems like ever min is over kill unless
# this is a very common problem.  If once a min change */5 to *
# once every 2 mins */5 to */2 ...
#
# */5 * * * * /usr/local/bin/WiFi_Check
#======================================== ==================================
# Settings
# Where and what you want to call the Lockfile
lockfile='/var/log/WiFi_Check.pid'
# Which Interface do you want to check/fix
wlan='wlan0'
pingip='192.168.2.1'
##################################################################
echo
echo "Starting WiFi check for $wlan"
date
echo

# We can perform check
echo "Performing Network check for $wlan"
/bin/ping -c 2 -I $wlan $pingip > /dev/null 2> /dev/null
if [ $? -ge 1 ] ; then
    echo "##################################################################" >> /var/log/wificheck.log
    date >> /var/log/wificheck.log
    echo "Network connection down! Raspberry Reboot!." >> /var/log/wificheck.log
    echo "Pi hat keine Internetverbindung und wird neugestartet" >> /var/log/wificheck.log
    echo "##################################################################" >> /var/log/wificheck.log
echo "##################################################################" >> /var/log/wificheck.log
    sleep 10
    shutdown -r now
else
    echo "Network is Okay"
fi
