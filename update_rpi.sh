#!/bin/bash
# ======================================= ==================================
#
#       Datei:   		update_rpi.sh
#
#       Beschreibung:   Update Raspberry
#       Autor:      	Marc Helpenstein(helpi9007@gmail.com)
#       Version:    	1.0
#       Erstellt:
#       Revision:   	-
# ======================================= ==================================
# Zuerst agt-get update
sudo apt-get update

# Dann upgrade  und autoremove
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# Zum Schluss noch rpi-update und einen Neustart
sudo apt-get rpi-update -y

echo "Update wurde durchgeführt Pi wird nun neugestartet!"

sudo reboot
