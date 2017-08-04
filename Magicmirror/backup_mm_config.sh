#!/bin/sh
#========================== =======================
#
#     FILE:           		backup_mm_config.sh
#     PROJECT:          		Scripte
#
#     AUTHOR:           		HelpiStone
#     EMAIL:            		helpi9007@gmail.com
#     CREATED:          	05-06-2017
#
#     MODIFIED BY:      	macbook
#     MODIFIED DATE:  	05-06-2017
#
#     DESCRIPTION:   	"Backup von Config erstellen"
#
#========================== =======================

config=/home/pi/MagicMirror/config/config.js
backup=/home/pi/MagicMirror/config/backup

datum=$(date +%Y_%m_%d)

# Ordner test erstellen falls dieser nicht vorhanden ist
ls $backup 2>/dev/null

if [ "$?" != "0" ]; then
        mkdir $backup

fi

cp $config $backup/config_$datum.js
