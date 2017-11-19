#!/bin/bash
#======================================== ==================================
#     FILE:             wifi_con.sh
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
#======================================== ==================================

# restart network if it goes down; must escape \% in cron
#* * * * * /bin/ping -c 2 -I wlan0 8.8.8.8 > /dev/null || (/sbin/ifdown wlan0; sleep 5; /sbin/ifup --force wlan0; echo $(date "+\%Y-\%m-\%d \%H:\%M:\%S") network reset >> /var/log/network.log)

/bin/ping -c 2 -I wlan0 8.8.8.8 /dev/null
if [[ $? -ge 1 ]]; then
     /sbin/ifdown wlan0
     sleep 5
     /sbin/ifup --force wlan0
     echo $(date "+\%Y-\%m-\%d \%H:\%M:\%S") \
     network reset >> /var/log/network.log
else
    echo "alles ok"
fi
