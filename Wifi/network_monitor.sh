#!/bin/bash

HOST=www.google.com

while true ; do
	if ifconfig wlan0 | grep -q "inet addr:" ; then
		#$printf "WLAN connected, IP: %s\n" $(hostname -I)
		sleep 60
	else
		echo "Network connection down! Attempting reconnection."
		# First try
		ifconfig wlan0 down
		sleep 3
		ifconfig wlan0 up
		sleep 10
		iwconfig wlan0 essid any
		sleep 10
		ping -c 1 -W 10 $HOST &>/dev/null
		if  [ $? -eq 0 ]; then
			exit
		else
			# Second try
			service networking restart
			iwconfig wlan0 essid any
			sleep 10
			ping -c 1 -W 10 $HOST &>/dev/null
		fi
		sleep 30
	fi
done