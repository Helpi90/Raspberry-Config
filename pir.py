#!/usr/bin/python
import RPi.GPIO as GPIO
import time

# BCM GPIO-Referenen verwenden (anstelle der Pin-Nummern)
# und GPIO-Eingang definieren
GPIO.setmode(GPIO.BCM)
GPIO_PIR = 4

print "PIR-Modul gestartet (CTRL-C to exit)"

# Set pin as input
GPIO.setup(GPIO_PIR,GPIO.IN)

# Initialisierung
Read  = 0
State = 0

try:
  print "Warten, bis PIR im Ruhezustand ist ..."

  # Schleife, bis PIR == 0 ist
  while GPIO.input(GPIO_PIR) != 0:
    time.sleep(0.1)
  print "Bereit..."

  # Endlosschleife, Ende mit STRG-C
  while True:
    # PIR-Status lesen
    Read = GPIO.input(GPIO_PIR)

    if Read == 1 and State == 0:
      # PIR wurde getriggert
      print "Bewegung erkannt!"
      # Zustand merken
      State = 1
    elif Read == 0 and State == 1:
      # PIR wieder im Ruhezustand
      print "Bereit..."
      # Zustand merken
      State = 0

    # kleine Pause
    time.sleep(0.1)

except KeyboardInterrupt:
  # Programm beenden
  print "Ende..."
  GPIO.cleanup()
Statt des Wartens in einer Schleife besteht die Möglichkeit, den Daten-Pin so zu initialisieren, dass eine Veränderung, genauer ein Wechsel von "0" auf "1", an das Skript übergeben wird. Dazu wird dann eine Callback-Funktion Motion() zum Auslesen des Pinzutands definiert, die beim Auftreten einer positiven Flanke automatisch aufgerufen wird. Der Vorteil dabei ist, das der Code nicht ständig den Pin-Status überprüft, sondern schläft, bis etwas passiert.

#!/usr/bin/python

import RPi.GPIO as GPIO
import time
import datetime

# BCM GPIO-Referenen verwenden (anstelle der Pin-Nummern)
# und GPIO-Eingang definieren
GPIO.setmode(GPIO.BCM)
GPIO_PIR = 4

print "PIR-Modul gestartet (CTRL-C to exit)"

# Set pin as input
GPIO.setup(GPIO_PIR,GPIO.IN)

# Initialisierung
Read  = 0
State = 0

print "Warten, bis PIR im Ruhezustand ist ..."

# Schleife, bis PIR == 0 ist
while GPIO.input(GPIO_PIR) != 0:
  time.sleep(0.1)
print "Bereit..."

# Callback-Funktion
def MOTION(PIR_GPIO):
  print "%s - Bewegung erkannt!" % datetime.datetime.now()

print "%s - Warten auf Bewegung" % datetime.datetime.now()

try:
  # Ereignis definieren: steigende Flanke
  GPIO.add_event_detect(GPIO_PIR, GPIO.RISING, callback=MOTION)
  # laenger schlafen - Callback wird durch die Flanke aktiviert
  while True:
    time.sleep(60)

except KeyboardInterrupt:
  # Programm beenden
  print "Ende..."
  GPIO.cleanup()