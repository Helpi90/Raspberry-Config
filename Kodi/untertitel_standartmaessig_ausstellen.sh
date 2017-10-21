#!/bin/bash
#======================================== ==================================
#     FILE:             untertitel_standartmaessig_ausstellen.sh
#     AUTHOR:           Helpi_Stone
#     EMAIL:            helpi9007@gmail.com
#     CREATED:          2017-10-14
#
#     MODIFIED BY:      Helpi_Stone
#     MODIFIED DATE:    2017-10-14
#
#     DESCRIPTION:      "Stellt den Untertitel standartmäßig in der Datei #                        guisettings.xml aus. Script muss im home Verzeichniss #                        ausgeführt werden"
#
#     VERSION:           1.0
#======================================== ==================================

cd .kodi/userdata/ && \
    cat guisettings.xml | \
    sed -e \
    's/<showsubtitles>true<[\/]showsubtitles>/<showsubtitles>false<\/showsubtitles>/' > gsub.xml && \
    mv gsub.xml guisettings.xml && \
    cd && \
    killall -9 kodi.bin
