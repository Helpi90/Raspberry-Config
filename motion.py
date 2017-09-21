#!/usr/bin/env python
#     FILE:                                motion.py
#     AUTHOR:                        macbook
#     EMAIL:                             helpi9007@gmail.com
#     CREATED:                      2017-09-21
#
#     MODIFIED BY:                macbook
#     MODIFIED DATE:           2017-09-21
#
#     DESCRIPTION:               "Beschreibung"
#
#     VERSION:                        1.0
#
#I wrote this script to control my Rasppery Pi's HDMI On/Off using a PIR module

import RPi.GPIO as GPIO
from os import system
import time

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(40, GPIO.IN)         #Read output from PIR motion sensor

while True:
       i=GPIO.input(40)
       if i==1:                 #When output from motion sensor is HIGH
             print "Turn on monitor",i
             system("/opt/vc/bin/tvservice -p")
             time.sleep(300)
       elif i==0:               #When output from motion sensor is LOW
             print "Monitor is off",i
             system("/opt/vc/bin/tvservice -o")
             time.sleep(0.1)
