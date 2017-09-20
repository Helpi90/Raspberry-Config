#!/usr/bin/env python
#     FILE:                                Raspberry_Door.py
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

import RPi.GPIO as GPIO
import pycurl, json
from StringIO import StringIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(23, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(25, GPIO.OUT)

appID = "54bc5b49a4c48a3d5bf22c4c"
appSecret = "a55bc3eb578bcd5d9065d24f83fa3219"

pushEvent = "RaspberryDoor"
pushMessage = "Door Opened!"

# use StringIO to capture the response from out push API call
buffer = StringIO()

curl = pycurl.Curl()

curl.setopt(curl.URL, 'https://api.instapush.im/post')
curl.setopt(curl.HTTPHEADER, ['x-instapush-appid:'+appID,
'x-instapush-appsecret:'+appSecret,
'Content-Type: application/json'])

json_fields = {}
json_fields['event'] = pushEvent
json_fields['trackers'] = {}
json_fields['trackers']['message'] = pushMessage

postfields = json.dumps(json_fields)

curl.setopt(curl.POSTFIELDS, postfields)
curl.setopt(curl.WRITEFUNCTION, buffer.write)

while True:
        GPIO.wait_for_edge(23, GPIO.RISING)
        print("Door Opened!")
        GPIO.output(25, GPIO.HIGH)
        # send the push request
        curl.perform()
        # capture the response from the server
        body = buffer.getvalue()
        print(body)
        # reset the buffer
        buffer.truncate(0)
        buffer.seek(0)

        GPIO.wait_for_edge(23, GPIO.FALLING)
        print("Door Closed!")
        GPIO.output(25, GPIO.LOW)
else:
        curl.close()
        GPIO.cleanup()
