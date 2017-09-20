#!/bin/bash -e
#======================================== ==================================
#     FILE:                                backupSD.sh
#     AUTHOR:                        macbook
#     EMAIL:                             helpi9007@gmail.com
#     CREATED:                      2017-09-13
#
#     MODIFIED BY:                macbook
#     MODIFIED DATE:           2017-09-13
#
#     DESCRIPTION:               "Beschreibung"
#
#     VERSION:                        1.0
#======================================== ==================================
#

sudo dd if=/dev/rdisk2 bs=1m | gzip > ~/Desktop/pi.$(date "+%Y.%m.%d").gz

diskutil unmountDisk /dev/disk1
gzip -dc ~/Desktop/pi.$(date "+%Y.%m.%d").gz | sudo dd of=/dev/rdisk2 bs=1m
