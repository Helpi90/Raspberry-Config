#!/usr/bin/env python
#     FILE:                                reboot_pi_no_network.py
#     AUTHOR:                        macbook
#     EMAIL:                             helpi9007@gmail.com
#     CREATED:                      2017-09-21
#
#     MODIFIED BY:                macbook
#     MODIFIED DATE:           2017-09-21
#
#     DESCRIPTION:               "Beschreibung"
#
#     VERSION:                        1.0
#

#This will reboot my Raspberry Pi if it does not detect a network connection
import os,datetime

logfile = '/home/pi/Documents/Logs/logs.log'

def check_ping(host):
    response = os.system("ping -c 1 " + host)
    # and then check the response...
    if response == 0:
        with open(logfile,"a") as myfile:
            myfile.write("{0} - Network Active\n ".format(str(datetime.datetime.now())))
    else:
        with open(logfile,"a") as myfile:
            myfile.write("{0} - Network Down\n".format(str(datetime.datetime.now())))
        os.system("sudo shutdown -r now")

check_ping("192.168.1.1")
