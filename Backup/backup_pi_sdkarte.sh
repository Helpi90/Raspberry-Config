#!/bin/sh
#========================== =======================
#
#     FILE:           		backup_pi_sdkarte.sh
#     PROJECT:          		Scripte
#
#     AUTHOR:           		HelpiStone
#     EMAIL:            		helpi9007@gmail.com
#     CREATED:          	18-05-2017
#
#     MODIFIED BY:      	macbook
#     MODIFIED DATE:  	18-05-2017
#
#     DESCRIPTION:   	"Backup von SD-Karte per LAN"
#
#========================== =======================

# Configuration
external="/media/Nas"       # Check if external storage is mounted
pi="Homegear"	# Name des Raspberrys
folder="$external/$pi" # Base backup Ordner
dev="/dev/mmcblk0"       # Device to backup

date=$(date +%m-%d-%Y)

echo "$date" >> /var/log/backup.log

sudo dd if=/dev/mmcblk0 of=$folder/rp-sicherung_$date.img bs=1MB >> /var/log/backup.log
