#!/bin/sh
#========================== =======================
#
#     FILE:           		backup_magicmirror.sh
#     PROJECT:          		Scripte
#
#     AUTHOR:           		HelpiStone
#     EMAIL:            		helpi9007@gmail.com
#     CREATED:          	15-05-2017
#
#     MODIFIED BY:      	macbook
#     MODIFIED DATE:  	15-05-2017
#
#     DESCRIPTION:   	""
#
#========================== =======================

TODAY=$(date +%Y-%m-%d-%H-%M-%S)

sudo tar -czf /backup/magicmirror_$TODAY.tar.gz /home/pi/MagicMirror/
