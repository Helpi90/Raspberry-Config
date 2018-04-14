#!/bin/bash
###
# Filename:          get_data_from_pi.sh
# Project:           Raspberry-Config
# Author:            macbook 
# -----
# File Created:      13-01-2018
# -----
# Last Modified:     13-01-2018
# Modified By:       macbook 
# -----
###


# Return % of CPU used by user
# Based on: https://rosettacode.org/wiki/Linux_CPU_utilization#Python
def getCPUuse():
    global _last_idle, _last_total
    try:
        with open('/proc/stat') as f:
            fields = [float(column) for column in f.readline().strip().split()[1:]]
        idle, total = fields[3], sum(fields)
        idle_delta, total_delta = idle - _last_idle, total - _last_total
        _last_idle, _last_total = idle, total
        res = round(100.0 * (1.0 - idle_delta / total_delta), 2 )
    except:
        res = 0.0
    return res

def getCPUcount():
    return os.cpu_count()

def getCPUuptime():
    try:
        with open('/proc/uptime') as f:
            fields = [float(column) for column in f.readline().strip().split()]
        res = round(fields[0])
    except:
        res = 0.0
    return res

# Return GPU temperature
def getGPUtemperature():
    try:
        res = os.popen("/opt/vc/bin/vcgencmd measure_temp").readline().replace("temp=", "").replace("'C\n", "")
    except:
        res = "0"
    return float(res)

def getGPUmemory():
    try:
        res = os.popen("/opt/vc/bin/vcgencmd get_mem gpu").readline().replace("gpu=", "").replace("M\n", "")
    except:
        res = "0"
    return float(res)

def getCPUmemory():
    try:
        res = os.popen("/opt/vc/bin/vcgencmd get_mem arm").readline().replace("arm=", "").replace("M\n", "")
    except:
        res = "0"
    return float(res)

# Return GPU temperature
def getCPUtemperature():
    try:
        res = os.popen("cat /sys/class/thermal/thermal_zone0/temp").readline()
    except:
        res = "0"
    return round(float(res)/1000,1)

# Return CPU speed in Mhz
def getCPUcurrentSpeed():
    try:
        res = os.popen("cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq").readline()
    except:
        res = "0"
    return round(int(res)/1000)

# Return RAM information in a list
# Based on: https://gist.github.com/funvill/5252169
def getRAMinfo():
    p = os.popen("free -b")
    i = 0
    while 1:
        i = i + 1
        line = p.readline()
        if i == 2:
            res = line.split()[1:4]
            # Index 0: total RAM
            # Index 1: used RAM
            # Index 2: free RAM
            return round(100 * int(res[1]) / int(res[0]), 2 )

# Get uptime of RPi
# Based on: http://cagewebdev.com/raspberry-pi-showing-some-system-info-with-a-python-script/
def getUpStats():
    #Returns a tuple (uptime, 5 min load average)
    try:
        s = os.popen("uptime").readline()
        load_split = s.split("load average: ")
        load_five = float(load_split[1].split(",")[1])
        up = load_split[0]
        up_pos = up.rfind(",", 0, len(up)-4)
        up = up[:up_pos].split("up ")[1]
        return up
    except:
        return ""
