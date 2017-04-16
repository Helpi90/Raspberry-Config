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
sudo apt-get update

# Dann upgrade  und autoremove
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# Zum Schluss noch rpi-update und einen Neustart
sudo apt-get -y rpi-update

echo "Update wurde durchgeführt Pi wird nun neugestartet!"

sudo reboot
