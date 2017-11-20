#!/bin/bash
export PATH=$PATH:/sbin 

# Auto reconnect to specified WIFI access point if there is no internect connection
# Author:	Lance
# Website:	http://www.shuyz.com
# Last updated: 2013/05/25

#your WIFI SSID here to be auto connect
SSID=ShuYZ

date

if ifconfig eth0 | grep -q "inet addr:" ; then
	echo "Wired connection OK, skip checking wifi."
else
	echo "No wired connection, checking WIFI..."
	if ifconfig | grep -q "wlan0" ; then
		if ifconfig wlan0 | grep -q "inet addr:" ; then
			echo "Wireless connection OK."
		else
			if iwlist wlan0 scan | grep -q ${SSID} ; then
				echo "WIFI access point ${SSID} found, reconnectting..."
				sudo ifup --force wlan0
#				sudo reboot
			else
				echo "WIFI access point ${SSID} not found!"
			fi
		fi
	else
		echo "Wireless adapter not found!"
	fi
fi

echo "job done!"