#!/bin/sh
#===============================================================================
#
#     FILE:           update_rpi.sh
#
#		  AUTHOR:         Helpi_Stone
#     EMAIL:          helpi9007@gmail.com
#     CREATED:        22-04-2017
#
#     MODIFIED BY:    Helpi_Stone
#     MODIFIED DATE:  22-04-2017
#
#     DESCRIPTION:    ""
#
#===============================================================================

### Zuerst agt-get update
sudo apt-get update

# Dann upgrade  und autoremove
sudo apt-get upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

# Zum Schluss noch rpi-update und einen Neustart
sudo rpi-update

echo "Update wurde durchgefuehrt Pi wird nun neugestartet!"

sudo reboot
