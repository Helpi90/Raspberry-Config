#!/bin/bash
#
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
#   ========================       ==========================



# Zuerst apt-get update
sudo apt-get update

# Dann upgrade  und autoremove
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# Zum Schluss noch rpi-update und einen Neustart
sudo apt-get rpi-update -y

echo "Update wurde durchgeführt Pi wird nun neugestartet!"

sudo reboot
