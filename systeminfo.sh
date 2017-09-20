#!/bin/bash
#======================================== ==================================
#     FILE:                                systeminfo.sh
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


function convert_to_MHz {
    let value=$1/1000
    echo "$value"
}

function calculate_overvolts {
    # We can safely ignore the integer
    # part of the decimal argument
    # since it's not realistic to run the Pi
    # at voltages higher than 1.99 V
    let overvolts=${1#*.}-20
    echo "$overvolts"
}

temperature=$(vcgencmd measure_temp)
temperature=${temperature:5:4}

volts=$(vcgencmd measure_volts)
volts=${volts:5:4}

if [ $volts != "1.20" ]; then
    overvolts=$(calculate_overvolts $volts)
fi

minClock=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq)
minClock=$(convert_to_MHz $minClock)

maxClock=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq)
maxClock=$(convert_to_MHz maxClock)

clock=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
clock=$(convert_to_MHz $clock)

governor=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)

echo "Temperature:   $temperature C"
echo -n "Voltage:       $volts V"
[ $overvolts ] && echo " (+0.$overvolts overvolt)" || echo -e "\r"
echo "Min speed:     $minClock MHz"
echo "Max speed:     $maxClock MHz"
echo "Current speed: $clock MHz"
echo "Governor:      $governor"

exit 0
