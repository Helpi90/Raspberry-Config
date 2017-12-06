# -*- coding: utf-8 -*-
# @Author: macbook
# @Date:   2017-11-20
# @Last Modified by:   macbook
# @Last Modified time: 2017-11-20

#!/usr/bin/python

import time
import smbus
import RPi.GPIO as GPIO
from time import sleep

BUSNR  = 1
ADDR1  = 0x21
IODIRA = 0x00
IODIRB = 0x01
GPIOA  = 0x12
GPIOB  = 0x13

PINA0 = [0x01]
PINA1 = [0x02]
PINA2 = [0x04]
PINA3 = [0x08]
PINA4 = [0x10] #gruen
PINA5 = [0x20] #gelb
PINA6 = [0x40] #rot
PINA7 = [0x80]
PINAC = [0x60] #rot gelb
PINAA = [0x00]

PINB0 = [0x01]
PINB1 = [0x02] #rot
PINB2 = [0x04] #gelb
PINB3 = [0x08] #gruen
PINB4 = [0x10]
PINB5 = [0x20]
PINB6 = [0x40]
PINB7 = [0x80]
PINBC = [0x06] #rot gelb
PINBA = [0x00]

i2cBus = smbus.SMBus(BUSNR)
i2cBus.write_byte_data(ADDR1, IODIRA, 0x00)
i2cBus.write_byte_data(ADDR1, IODIRB, 0x01)

DELAY_0 = 0.1
DELAY_1 = 3
DELAY_2 = 10


GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.cleanup()

GPIO.setup(14, GPIO.OUT)
GPIO.output(14, True)
GPIO.setup(22, GPIO.IN)


def ampel():
    for leds in PINA4:
        i2cBus.write_byte_data(ADDR1, GPIOA, leds)
    for leds in PINB1:
        i2cBus.write_byte_data(ADDR1, GPIOB, leds)
        sleep(DELAY_2)
    for leds in PINA5:
        i2cBus.write_byte_data(ADDR1, GPIOA, leds)
    for leds in PINBC:
        i2cBus.write_byte_data(ADDR1, GPIOB, leds)
        sleep(DELAY_1)
    for leds in PINA6:
        i2cBus.write_byte_data(ADDR1, GPIOA, leds)
    for leds in PINB3:
        i2cBus.write_byte_data(ADDR1, GPIOB, leds)
        sleep(DELAY_2)
    for leds in PINAC:
        i2cBus.write_byte_data(ADDR1, GPIOA, leds)
    for leds in PINB2:
        i2cBus.write_byte_data(ADDR1, GPIOB, leds)
        sleep(DELAY_1)
    for leds in PINA4:
        i2cBus.write_byte_data(ADDR1, GPIOA, leds)
    for leds in PINB1:
        i2cBus.write_byte_data(ADDR1, GPIOB, leds)
        sleep(DELAY_2)
    for leds in PINAA:
        i2cBus.write_byte_data(ADDR1, GPIOA, leds)
    for leds in PINBA:
        i2cBus.write_byte_data(ADDR1, GPIOB, leds)


while True:
        if not (GPIO.input(22)):
                GPIO.output(14, False)
                sleep(DELAY_0)
                GPIO.output(14, True)
                sleep(DELAY_0)
                GPIO.output(14, False)
                sleep(DELAY_0)
                GPIO.output(14, True)
                sleep(DELAY_0)
                ampel()
        time.sleep(.5)
