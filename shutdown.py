# -*- coding: utf-8 -*-
# @Author: macbook
# @Date:   2017-11-20
# @Last Modified by:   macbook
# @Last Modified time: 2017-11-20

#!/usr/bin/python

# shutdown script for Raspberry Pi
# status led on pin 14: ON = ready, BLINK = confirm button

import glob
import random
import RPi.GPIO as GPIO
import os
import time
import pygame.mixer
import sys, traceback
from time import sleep, gmtime, localtime, strftime
import datetime

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.cleanup()
GPIO.setup(14, GPIO.OUT)
GPIO.output(14, True)
GPIO.setup(22, GPIO.IN)

pygame.mixer.init(48000,-16,1,1048576)
soundfilesshutdown = glob.glob("rasposound/shutdown/*.wav")
soundfilesdown = glob.glob("rasposound/down/*.wav")


def LogWrite(str):
    file = open('/var/log/test.txt', "a+")
    file.write(str + '\n')
    file.close()


def playshutdown():
    print("playing")
    pygame.mixer.Sound(random.choice(soundfilesshutdown)).play()


def playdown():
    print("playing")
    pygame.mixer.Sound(random.choice(soundfilesdown)).play()

# start the loop for every .5 seconds, waiting for LOW on pin 22
# then 2 short flashes with led to confirm and shutdown to sleep mode

while True:
        if not (GPIO.input(22)):
                LogWrite(strftime("%d/%m/%Y %H:%M:%S", localtime())+"   Not Shutdown Interrupt")
                playshutdown()
                GPIO.output(14, False)
                time.sleep(.1)
                GPIO.output(14, True)
                time.sleep(.1)
                GPIO.output(14, False)
                time.sleep(.1)
                GPIO.output(14, True)
                time.sleep(4)
                playdown()
                time.sleep(2)
                os.system("sudo shutdown -h now")
        time.sleep(.5)
