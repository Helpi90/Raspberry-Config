#!/bin/sh
#===============================================================================
#
#
#		  AUTHOR:         macbook
#     EMAIL:          helpi9007@gmail.com
#     CREATED:        16-04-2017
#
#     MODIFIED BY:    macbook
#     MODIFIED DATE:  16-04-2017
#
#     DESCRIPTION:    ""
#
#===============================================================================

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
