#!/bin/bash
#======================================== ==================================
#     FILE:             backupSD.sh
#     AUTHOR:           macbook
#     EMAIL:            helpi9007@gmail.com
#     CREATED:          2018-01-02
#
#     MODIFIED BY:      macbook
#     MODIFIED DATE:    2018-01-02
#
#     DESCRIPTION:      "Beschreibung"
#
#     VERSION:           1.0
#======================================== ==================================

# VARIABLEN - HIER EDITIEREN
BACKUP_PFAD="/pfad/zum_backup_order"
BACKUP_ANZAHL="2"
BACKUP_NAME="RaspberryPiBackup"
DIENSTE_START_STOP="service mysql"
# ENDE VARIABLEN

# Stoppe Dienste vor Backup
${DIENSTE_START_STOP} stop

# Backup mit Hilfe von dd erstellen und im angegebenen Pfad speichern
dd if=/dev/mmcblk0 of=${BACKUP_PFAD}/${BACKUP_NAME}-$(date +%Y%m%d-%H%M%S).img bs=1MB

# Starte Dienste nach Backup
${START_SERVICES} start

# Alte Sicherungen die nach X neuen Sicherungen entfernen
pushd ${BACKUP_PFAD}; ls -tr ${BACKUP_PFAD}/${BACKUP_NAME}* | head -n -${BACKUP_ANZAHL} | xargs rm; popd
