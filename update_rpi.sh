#!/bin/bash
# ======================================= ==================================
#
#       Datei:   		update_rpi.sh
#
#       Beschreibung:   Update RPI
#       Autor:      	Marc Helpenstein(helpi9007@gmail.com)
#       Version:    	1.0
#       Erstellt:   	02.04.2017
#       Revision:   	-
# ======================================= ==================================
# Zuerst apt-get update
/usr/bin/sudo apt-get update 

# Dann upgrade  und autoremove
/usr/bin/sudo apt-get -y upgrade
/usr/bin/sudo apt-get -y dist-upgrade
/usr/bin/sudo apt-get -y autoremove

# Zum Schluss noch rpi-update und einen Neustart
/usr/bin/sudo apt-get -y rpi-update

echo "Update wurde durchgeführt Pi wird nun neugestartet!"

/usr/bin/sudo reboot