#!/bin/bash
#======================================== ==================================
#     FILE:                                camera.sh
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
##!/bin/bash

for number in 1 2
do
    # Time of photo
    DATE=$(date +"%Y-%m-%d %H:%M:%S")

    # Name and location to photo
    FILE="/home/pi/camera/$DATE.jpg"

    # Set up some variables to change the exposure settings based on time
    # Could this be linked to sunrise/sunet? Its quite a guesstimate..
    # Depends on where the camera is pointing too..
    EX="auto"
    ISO="100"
    HOUR=$(date +"%k")
    if [ $HOUR -lt 6 ] || [ $HOUR -gt 19 ];
    then
        EX="night"
        ISO="400"
    fi

    # Take the picture (shutter speed is needed to keep exposure constant)
    raspistill -ss 1000 -ISO $ISO -ex $EX -t 1 -sh 50 -vf -hf -o $FILE

    # Resize and compress to save space
    convert $FILE -resize 2600 -quality 90 $FILE

    sleep 10
done
