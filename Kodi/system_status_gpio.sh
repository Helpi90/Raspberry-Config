#!/bin/bash
#======================================== ==================================
#     FILE:             system_status_gpio.sh
#     AUTHOR:           Helpi_Stone
#     EMAIL:            helpi9007@gmail.com
#     CREATED:          2017-10-14
#
#     MODIFIED BY:      Helpi_Stone
#     MODIFIED DATE:    2017-10-14
#
#     DESCRIPTION:      "CPU Temp auslesen und Fan steuern"
#
#     VERSION:           1.0
#
#####################################################################
#
# Setting up GPIO:s

echo "22" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio22/direction

echo "23" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio23/direction

echo "24" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio24/direction

echo "25" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio25/direction

GPIO22="/sys/class/gpio/gpio22/value"
GPIO23="/sys/class/gpio/gpio23/value"
GPIO24="/sys/class/gpio/gpio24/value"
GPIO25="/sys/class/gpio/gpio25/value"

#####################################################################
#
# Test all fan speeds during boot and lock it at step 5 for 10 seconds.

echo "1" > $GPIO22
sleep 2
echo "0" > $GPIO22
echo "1" > $GPIO23
sleep 2
echo "1" > $GPIO22
sleep 2
echo "0" > $GPIO22
echo "0" > $GPIO23
echo "1" > $GPIO24
sleep 2
echo "0" > $GPIO24
echo "1" > $GPIO25
sleep 10
echo "0" > $GPIO25


#####################################################################
#
# Read preference file

T1=`grep "CPU_TEMP_1" /storage/scripts/CPU_Temp.txt | cut -d'=' -f2-`
T2=`grep "CPU_TEMP_2" /storage/scripts/CPU_Temp.txt | cut -d'=' -f2-`
T3=`grep "CPU_TEMP_3" /storage/scripts/CPU_Temp.txt | cut -d'=' -f2-`
T4=`grep "CPU_TEMP_4" /storage/scripts/CPU_Temp.txt | cut -d'=' -f2-`
T5=`grep "CPU_TEMP_5" /storage/scripts/CPU_Temp.txt | cut -d'=' -f2-`

#####################################################################
#
# Start the fan automation

while
CPU_TEMP1=`cat /sys/class/thermal/thermal_zone0/temp`
CPU_TEMP2=$(($CPU_TEMP1 / 1000))
do
if [ "$CPU_TEMP2" -ge "$T5" ]; then
    echo "Fan step 5"
    echo "0" > $GPIO22
    echo "0" > $GPIO23
    echo "0" > $GPIO24
    echo "1" > $GPIO25
else
    if [ "$CPU_TEMP2" -ge "$T4" ]; then
        echo "Fan step 4"
        echo "0" > $GPIO22
        echo "0" > $GPIO23
        echo "0" > $GPIO25
        echo "1" > $GPIO24
    else
        if [ "$CPU_TEMP2" -ge "$T3" ]; then
            echo "Fan step 3"
            echo "0" > $GPIO24
            echo "0" > $GPIO25
            echo "1" > $GPIO22
            echo "1" > $GPIO23
        else
            if [ "$CPU_TEMP2" -ge "$T2" ]; then
                echo "Fan step 2"
                echo "0" > $GPIO22
                echo "0" > $GPIO24
                echo "0" > $GPIO25
                echo "1" > $GPIO23
            else
                if [ "$CPU_TEMP2" -ge "$T1" ]; then
                    echo "Fan step 1"
                    echo "0" > $GPIO23
                    echo "0" > $GPIO24
                    echo "0" > $GPIO25
                    echo "1" > $GPIO22
                else
                    echo "Fan step 0"
                    echo "0" > $GPIO22
                    echo "0" > $GPIO23
                    echo "0" > $GPIO24
                    echo "0" > $GPIO25
                fi
            fi
        fi
    fi
fi
sleep 5
done
