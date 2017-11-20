Bash History unendlich setzen

Befehl:
sudo nano ~/.bashrc

Edit:
HISTSIZE=20000         #definiert Ramgröße
HISTFILESIZE=""        #definiert Dateigröße
____________________________________________

Passwort Benutzer ändern

Befehl:
passwd pi

aktuelles Passwort eingeben
2x neues Passwort eingeben
-----

Befehl:
sudo passwd root

aktuelles Passwort eingeben
2x neues Passwort eingeben

Befehl:
sudo adduser pi i2c
sudo adduser pi root
-----

SSH WINSCP Root login:

Befehl:
sudo nano /etc/ssh/sshd_config

Edit:
PermitRootLogin without-password
to
PermitRootLogin yes
____________________________________________

Raspberry Pi ausschalten

Befehl:
sudo halt
sudo poweroff
sudo shutdown now -h
____________________________________________

Netzwerk einstellungen (WLAN) / LAN

------------------

Raspbian WLAN Schlafmodus abschalten

Befehl:
sudo nano /etc/modprobe.d/8192cu.conf

Edit:
options 8192cu rtw_power_mgnt=0 rtw_enusbss=0

save:
----
WLAN Sleepmode abschalten Raspberry Pi 3

Befehl:
sudo nano /etc/network/interfaces

Edit: # Unter den Zeilen der WLAN Konfiguration diese zwei Zeilen hinzufügen.
pre-up iw dev wlan0 set power_save off
post-down iw dev wlan0 set power_save on
-------------------

Interface Datei bearbeiten.

Befehl:
sudo nano /etc/network/interfaces

Edit:
# interfaces(5) file used by ifup(8) and ifdown(8)

# Please note that this file is written to be used with dhcpcd
# For static IP, consult /etc/dhcpcd.conf and 'man dhcpcd.conf'

# Include files from /etc/network/interfaces.d:
source-directory /etc/network/interfaces.d

auto lo
iface lo inet loopback

iface eth0 inet dhcp

auto wlan0
allow-hotplug wlan0
iface wlan0 inet dhcp
    wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
iface default inet dhcp

save:
-------------------

Wlan AP´s eintragen.

Befehl:
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf

Edit:
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
        ssid="tfk-home"
        psk="xxxx"
        proto=RSN
        key_mgmt=WPA-PSK
        pairwise=CCMP
        auth_alg=OPEN
}

network={
        ssid="AndroidHotspot"
        psk="xxxx"
        proto=RSN
        key_mgmt=WPA-PSK
        pairwise=CCMP
        auth_alg=OPEN
}

network={
        ssid="SamsungAP"
        scan_ssid=1
        psk="xxxx"
        proto=RSN
        key_mgmt=WPA-PSK
        pairwise=CCMP
        auth_alg=OPEN
}

#network={
#        ssid="HN1X"
#        scan_ssid=1
#        key_mgmt=WPA-EAP
#        eap=PEAP
#        ca_cert="/etc/Deutsche_Telekom_Root_CA_2.pem"
##        anonymous_identity="user@domain"
#        identity="xxxx"
#        password="xxxx"
#        phase1="peaplabel=0"
#        phase2="auth=MSCHAPV2"
#}

#network={
#        ssid="eduroam"
#        scan_ssid=1
#        key_mgmt=WPA-EAP
#        eap=PEAP
#        ca_cert="/etc/Deutsche_Telekom_Root_CA_2.pem"
#        anonymous_identity="user@domain"
#        identity="xxxx"
#        password="xxxx"
#        phase1="peaplabel=0"
#        phase2="auth=MSCHAPV2"
#}


save:

-----
NETWORK restart:
Befehl:
sudo /etc/init.d/networking/ restart
-----
DHCP discover:
Befehl:
sudo ifdown wlan0 / eth0
sudo ifup wlan / eth0
-----
WLAN testen:
Befehl:
sudo wpa_supplicant -dd -Dwext -iwlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
-----

____________________________________________

Raspberry Pi Grundeinrichtung

Befehl:
sudo raspi-config
____________________________________________

Raspberry Pi Update & Upgrade

Befehl:
sudo apt-get update
sudo apt-get upgrade
____________________________________________

Grafischen Shell Taskmanager "htop" installieren

Befehl:
sudo apt-get install htop

ausführen:
htop
____________________________________________

Raspobot Projekt Ordner im /home/pi erstellen

Befehl:
mkdir Raspobot
cd Raspobot
mkdir librarys
mkdir testcoding
mkdir examples
mkdir downloads
mkdir temp
mkdir raspocode
cd raspocode
mkdir images
mkdir rasposound
____________________________________________

Entwicklungs Tools installieren.

Befehl:
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install espeak
sudo apt-get install omxplayer
sudo apt-get install netcat
sudo apt-get install mplayer
sudo apt-get install i2c-tools
sudo apt-get install python-smbus
sudo apt-get install python-dev
sudo apt-get install python-serial
sudo apt-get install python-rpi.gpio
sudo apt-get install python-pip
sudo apt-get install samba
sudo apt-get install spe
sudo apt-get install git
sudo apt-get install git-core
sudo apt-get install build-essential
sudo apt-get install python-setuptools
sudo apt-get install psutil
sudo apt-get install unzip
sudo apt-get install lm-sensors
sudo apt-get install libi2c-dev
sudo apt-get install snmp
sudo apt-get install python-pygame
sudo apt-get install python-tk idle python-pmw python-imaging
sudo apt-get install dstat                  # dstat # dstat -c --top-cpu -d --top-bio --top-latency
sudo apt-get install iotop                  # sudo iotop
sudo apt-get install ifstat                 # ifstat
sudo pip install RPIO
sudo pip install pillow

-----

APT-GET anwendung erklärt:

Einlesen der Paketlisten aus Repositories:
Befehl:
apt-get update

Paket installieren:
Befehl:
apt-get install [paketname]

Paket deinstallieren (nur Programm):
Befehl:
apt-get remove [paketname]

Paket deinstallieren (komplettes Entfernen inklusive Konfigurationsdateien):
Befehl:
apt-get purge [paketname]

Pakete aktualisieren/updaten:
Befehl:
apt-get upgrade

Pakete zu Paketindex hinzufügen:
Befehl:
apt-cache add [dateiname.deb]

Anzeigen von Paketinformationen (übersichtlich):
Befehl:
apt-cache show [paketname]

Anzeigen von Paketinformationen (ausführlich):
Befehl:
apt-cache showpkg [paketname]

Anzeige von Abhängigkeiten des Paketes:
Befehl:
apt-cache depends [paketname]

Durchsucht Paketindex:
Befehl:
apt-cache search [suchbegriff]

Repositories oder auch dem darauf folgenden Paketindex gesprochen.
Diese sind in der Datei /etc/apt/sources.list definiert.
Befehl:
sudo nano /etc/apt/sources.list

Schlüssel hinzufügen
Befehl:
apt-key add [schlüsseldatei]

Schlüssel entfernen
Befehl:
apt-key del [schlüssel id]

Auflistung aller registrierter Schlüssel mit ID und Name
Befehl:
apt-key list ID
-----

Paket-Cache löschen
Befehl:
sudo apt-get autoremove
sudo apt-get clean
Danach kann man veraltete Init-Skripte und Konfigurationsdateien der alten Pakete entfernen.
Befehl:
sudo dpkg -P `dpkg -l | grep "^rc" | awk -F" " '{ print $2 }'`

-----

Paketquellen anpassen und aktualisieren
Befehl:
sudo nano /etc/apt/sources.list
Edit:
deb http://mirrordirector.raspbian.org/raspbian/ jessie main contrib non-free rpi
Vor allen anderen Zeilen setzt man ein "#".
Dann löscht man alte Paketquellen im Verzeichnis "/etc/apt/sources.list.d/".
Befehl:
sudo rm -f /etc/apt/sources.list.d/*
Dann erzeugt man eine neue Datei:
Befehl:
sudo nano /etc/apt/sources.list.d/raspi.list
Hier trägt man folgende Zeile ein:
Edit:
deb http://archive.raspberrypi.org/debian jessie main ui
Nachdem man die Paketquellen geändert hat, muss die Liste der verfügbaren Pakete aktualisiert werden.
Befehl:
sudo apt-get update
-----

sudo pip install psutil
Check for correct installation. This command must not throw errors.
sudo python -c "import psutil"
-----

Locate installieren
Befehl:
sudo apt-get install locate

Datenbank updaten:

Befehl:
sudo updatedb

Locate anwenden:
locate -i *.Dateiendung oder Name.Dateiendung
-----


Pastebin installieren.

Befehl:
sudo apt-get install pastebinit

ausführen:
cat xxxxx.py|pastebinit -f python
-----
NetIO installieren

Befehl:
sudo apt-get install -y nmap
-----
____________________________________________

Configuration GPIO I2C / SPI

Befehl:
sudo nano /etc/modprobe.d/raspi-blacklist.conf

Edit:
#blacklist i2c-bcm2708
#blacklist spi-bcm2708
-----
Befehl:
sudo nano /etc/modules

Edit:
i2c-dev
i2c-bcm2708
-----
Befehl:
sudo nano /boot/config.txt

Edit:
dtparam=i2c1=on
dtparam=i2c_arm=on
dtparam=i2c_arm=on,i2c_baudrate=400000
-----
I2C Adressstatus abfragen

Befehl:
sudo i2cdetect -y 1
-----
SPI Devicesatus abfragen

Befehl:
ls -l /dev/spidev*
_____________________________________________

NTP aktuallisieren

Befehl:
sudo apt-get purge ntp
sudo apt-get install ntpdate
sudo crontab -e
2
Edit:
@reboot ntpdate -s 0.de.pool.ntp.org
1 1 * * * ntpdate -s 0.de.pool.ntp.org
-----
manuele Abfrage:
Befehl:
sudo ntpdate ptbtime1.ptb.de
Webseite:
http://www.netzmafia.de/skripten/hardware/RasPi/RasPi_Install.html

_____________________________________________

Librarys installieren

Raspirobotboard:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/simonmonk/raspirobotboard.git
cd raspirobotboard
sudo python setup.py install --record install-files.txt
cd ..
Webseite:
https://github.com/simonmonk/raspirobotboard
-----

MCP23017:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/computerlyrik/MCP23017-RPi-python.git
cd MCP23017-RPi-python
sudo python setup.py install --record install-files.txt
cd ..
Webseite:
https://github.com/computerlyrik/MCP23017-RPi-python
-----

HMC5883L:

-----
Adafruit Python MCP9808:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/adafruit/Adafruit_Python_MCP9808.git
cd Adafruit_Python_MCP9808
sudo python setup.py install --record install-files.txt
cd ..
Webseite:
https://github.com/adafruit/Adafruit_Python_MCP9808
-----

Adafruit_SSD1306:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/adafruit/Adafruit_SSD1306.git
Webseite:
https://github.com/adafruit/Adafruit_SSD1306
-----

SH1106:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/rm-hull/ssd1306.git
cd ssd1306
sudo python setup.py install --record install-files.txt
cd ..
Webseite:
https://github.com/rm-hull/ssd1306
-----

Adafruit_Python_SSD1306
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/adafruit/Adafruit_Python_SSD1306.git
cd Adafruit_Python_SSD1306
sudo python setup.py install --record install-files.txt
cd ..
Webseite:
https://github.com/adafruit/Adafruit_Python_SSD1306
-----

ArduiPi_OLED:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/hallard/ArduiPi_OLED.git
cd ArduiPi_OLED
sudo make
cd ..
Webseite:
https://github.com/hallard/ArduiPi_OLED
-----

ArduiPi_SSD1306:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/hallard/ArduiPi_SSD1306.git
cd ArduiPi_OLED
sudo make
cd ..
Webseite:
https://github.com/hallard/ArduiPi_SSD1306
-----

37-Sensors-Code:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/hackabletype/37-Sensors-Code.git
Webseite:
https://github.com/hackabletype/37-Sensors-Code
http://botbook.com/code.html
-----

Adafruit-Raspberry-Pi-Python-Code:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code.git
cd Adafruit-Raspberry-Pi-Python-Code
Webseite:
https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code
-----

PCA9685 16 Bit Servo Controller:
Library ist in der Adafruit-Raspberry-Pi-Python-Code Library enthalten.
Tutorial Webseite:
https://learn.adafruit.com/adafruit-16-channel-servo-driver-with-raspberry-pi/overview
-----

Adafruit Python GPIO:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/adafruit/Adafruit_Python_GPIO.git
cd Adafruit_Python_GPIO
sudo python setup.py install --record install-files.txt
cd ..
Webseite:
https://github.com/adafruit/Adafruit_Python_GPIO
-----

TSL2591 Licht & IR Sensor:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/maxlklaxl/python-tsl2591.git
cd python-tsl2591
sudo apt-get install libffi5 libffi5-dbg libffi5-dev
sudo python setup.py install --record install-files.txt
cd ..
Webseite:
https://github.com/watterott/TSL25911-Breakout
-----

MCP9808-device:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/robotice-devices/mcp9808-device.git
Webseite:
https://github.com/robotice-devices/mcp9808-device
-----

WiringPi 2 Python
Befehl:
sudo apt-get install wiringpi
cd /Raspobot/librarys/
sudo git clone https://github.com/WiringPi/WiringPi2-Python.git
cd WiringPi2-Python
sudo python setup.py install --record install-files.txt
sudo git clone git://git.drogon.net/wiringPi
cd wiringPi
sudo git pull origin
sudo ./build
Webseite:
https://github.com/WiringPi/WiringPi2-Python

GPIO Status Check Test wiringPi’s installation
Befehl
gpio -v
gpio readall
-----

Pillow:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/python-pillow/Pillow.git
cd Pillow
sudo apt-get install libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
sudo apt-get install libjpeg-dev libpng12-dev libtiff-dev
sudo make
sudo python setup.py install --record install-files.txt
Webseite:
https://github.com/python-pillow/Pillow
https://pillow.readthedocs.org/en/3.1.x/installation.html
http://stackoverflow.com/questions/8915296/python-image-library-fails-with-message-decoder-jpeg-not-available-pil

-----

Oled_96:
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/BLavery/lib_oled96
Webseite:
https://github.com/BLavery/lib_oled96
-----

PIGPIO Libary installieren
Befehl:
cd /Raspobot/librarys/
wget abyz.co.uk/rpi/pigpio/pigpio.zip
unzip pigpio.zip
cd PIGPIO
sudo make
sudo make install
sudo pigpiod
git clone https://github.com/joan2937/pigpio
cd pigpio
sudo make
sudo make install
sudo python setup.py install --record install-files.txt
cd ..
-----

_____________________________________________________

Project Thermostat (MCP9808) Installation

Befehl:
cd /Raspobot/examples/
sudo git clone http://github.com/baldingwizard/thermostatpi
_____________________________________________________

GPU Temperatur ausgeben
Befehl:
/opt/vc/bin/vcgencmd measure_temp

Mailversand wenn CPU Temperatur kirtischen Wert übersteigt.
Webseite mit Tutorial:
http://jankarres.de/2013/12/raspberry-pi-ueberwachen-mit-monitoring/
Befehl für das regelmäßige wiederholen.
Befehl:
crontab -e
Edit:
*/5 * * * * python /home/pi/Raspobot/raspocode/monitoring-cpu-temp.py >/dev/null 2>&1
______________________________________________________

Bootvorgang Log ausgeben
Befehl:
dmesg | more
______________________________________________________

Soundmixer Lautstärke einstellen
Befehl: #Maximum
amixer cset numid=1 -- 400
Befehl: #Minimum
amixer cset numid=1 -- -10239
Webseite:
http://www.dronkert.net/rpi/vol.html
______________________________________________________

RPI Camera installieren und einrichten
Befehl:
cd /Raspobot/librarys/
sudo git clone https://github.com/silvanmelchior/RPi_Cam_Web_Interface.git
cd RPi_Cam_Web_Interface
sudo chmod u+x RPi_Cam_Web_Interface_Installer.sh                #alt
sudo ./RPi_Cam_Web_Interface_Installer.sh install                #alt
Configuration:                                                   #alt
sudo ./RPi_Cam_Web_Interface_Installer.sh install                #alt
-----
sudo chmod u+x install.sh
sudo ./install.sh install
Webseite:
http://192.168.2.42/html/index.php
http://elinux.org/RPi-Cam-Web-Interface
https://www.raspberrypi.org/forums/viewtopic.php?f=43&t=63276
http://raspberrypiguide.de/howtos/raspberry-pi-camera-how-to/
https://github.com/silvanmelchior/RPi_Cam_Web_Interface
________________________________________________________

Python Datei ausführbar machen.
Befehl:
chmod u+x test.py
Starten:
sudo ./test.py
________________________________________________________

Python Paket Library deinstallieren:
Befehl:
cd /Raspobot/librarys// #in die jeweilige Library mit "setup.py"
cat install-files.txt | sudo xargs rm -rf
Webseite:
http://codeyarns.com/2014/05/30/how-to-install-and-uninstall-python-module-from-source-code/
________________________________________________________________

im Ordner /Raspobot/raspocode die Dateien ausführbar machen.
Befehl:
sudo chmod +x tts_date_de1.sh
sudo chmod +x tts_time_de1.sh
sudo gcc -Ofast -mfpu=vfp -mfloat-abi=hard -march=armv6zk -mtune=arm1176jzf-s -Wall  -lssd1306 -lm uhr1.cpp -o uhr1
Datei ausführen:
sudo ./tts_date_de1.sh
________________________________________________________________

RAMDISK erstellen

tmpfs für /var/log einrichten

Befehl:
sudo nano /etc/init.d/varlog
Edit:
#!/bin/bash
### BEGIN INIT INFO
# Provides:          varlog
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# X-Start-Before:    $syslog
# X-Stop-After:      $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start/stop logfile saving
### END INIT INFO
#
# varlog        This init.d script is used to start logfile saving and restore.
#

varlogSave=/var/save.log/
[ ! -d $varlogSave ] && mkdir -p $varlogSave

PATH=/sbin:/usr/sbin:/bin:/usr/bin

case $1 in
    start)
        echo "*** Starting tmpfs file restore: varlog."
        if [ -z "$(grep /var/log /proc/mounts)" ]; then
            echo "*** mounting /var/log"
            cp -Rpu /var/log/* $varlogSave
            varlogsize=$(grep /var/log /etc/fstab|awk {'print $4'}|cut -d"=" -f2)
            [ -z "$varlogsize" ] && varlogsize="70M"
            mount -t tmpfs tmpfs /var/log -o defaults,size=$varlogsize
            chmod 755 /var/log
        fi
        cp -Rpu ${varlogSave}* /var/log/
    ;;
    stop)
        echo "*** Stopping tmpfs file saving: varlog."
        #[ -n $varlogSave ] && rm -rf ${varlogSave}*
        #[ ! -d $varlogSave ] && mkdir -p $varlogSave
        cp -Rpu /var/log/* $varlogSave >/dev/null 2>&1
        sync
        umount -f /var/log/
    ;;
    *)
        echo "Usage: $0 {start|stop}"
    ;;
esac

exit 0

-----

Befehl:
sudo chmod +x /etc/init.d/varlog
sudo update-rc.d varlog start 01 2 3 4 5 . stop 99 0 1 6 .
sudo /etc/init.d/varlog start
sudo /etc/init.d/varlog stop
Befehl:
sudo nano /etc/fstab
Edit:
tmpfs        /var/log    tmpfs    size=70M    0    0
Befehl:
sudo sed -i /etc/default/rcS -e "s/RAMRUN=no/RAMRUN=yes/"
sudo sed -i /etc/default/rcS -e "s/RAMLOCK=no/RAMLOCK=yes/"

Befehl:
sudo crontab -e
2
Edit:
#varlog - alle 25 minuten
*/25 * * * * /etc/init.d/varlog stop && sleep 2 && /etc/init.d/varlog start >/dev/null 2>&1
#varlog - Taeglich um 05:00
0 5 * * * /etc/init.d/varlog stop && sleep 2 && /etc/init.d/varlog start >/dev/null 2>&1

Befehl:
sudo reboot
Webseite:
http://www.forum-raspberrypi.de/Thread-tutorial-var-log-in-eine-art-ramdisk-auslagern-weitere-optimierungen-bezgl-logs
_______________________________________________________________________________

Bash Design Anpassung SSH Login

Befehl:
sudo nano /etc/motd
Edit:
nur reinen Text Formatierung einsetzen!
z.B. ein ASCII Generator: http://www.glassgiant.com/ascii/
-----

Befehl:
sudo nano /etc/bash.bashrc
Edit:
ip=`ip addr show scope global | grep inet | cut -d' ' -f6 | cut -d/ -f1`
let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`
# get the load averages
read one five fifteen rest < /proc/loadavg
echo -e "\n";
echo -e "\n";
echo -e "\n";
echo -e "                            =\$MMMMMMM       NMMMMMM\$I$=                         "
echo -e "                          MMM\033[1;32m7O\$\$777\033[0mM\$MM   MMZ\033[1;32m\$7\$7\$Z7O\033[0mMMM     "
echo -e "                          MN\033[1;32m\$\$Z\$\$\$\$\$\$\$\033[0mM7M,M\033[1;32m\$\$\$\$\$\$\$\$Z\$\$\033[0mMNM     "
echo -e "                          MM\033[1;32m\$\$\$\$\$M7\$\$\$\$\033[0mMDMM\$\033[1;32m\$7\$7N87\$\$\033[0mM\$MM      "
echo -e "                           MN\033[1;32m\$\$\$\$\$7MZ\$\$\033[0mM8MN\$\033[1;32m\$7M7\$\$\$\$\$\033[0mM\$M      "
echo -e "                           NM\033[1;32m\$\$\$\$\$\$\$\$\033[0mMMMMMMMM\033[1;32m\$\$\$\$\$\$7\033[0mM7ON       "
echo -e "                             M7\033[1;32m\$\$\$\$\$\$\033[0mMMMMMMMM\033[1;32m\$\$\$\$\$\$\033[0mM7MN        "
echo -e "                              MMM77DMMMMMMMMMN77MMM                "
echo -e "                              NMMDDMMN\033[1;31mZZZZZ\033[0mMMMNMMMM     "
echo -e "                             M\033[1;31mZZZZ\033[0mDM8\033[1;31m\033[1;31mZZZZZZZZ\033[0mM\033[1;31mZZZZ\033[0mNMD    "
echo -e "                            MO\033[1;31mZZZ\033[0mMMMMO\033[1;31m\033[1;31mZZZZZZ\033[0mNMMO\033[1;31mZZZ\033[0mMM    "
echo -e "                           ?M\033[1;31mZZ\033[0mNMMMNNMMMMMMM8ONMM\033[1;31mZZ\033[0m8MI      "
echo -e "                           MMMMMD\033[1;31mZZZZZZ\033[0mMMM\033[1;31mZZZZZZZ\033[0mMMMMM    "
echo -e "                          MNZMMO\033[1;31mZZZZZZZ\033[0mNMD\033[1;31mZZZZZZZZ\033[0mM8ZMM            "
echo -e "                         MD\033[1;31mZZ\033[0mNM\033[1;31mZZZZZZZZ\033[0mDMD\033[1;31mZZZZZZZZ\033[0mM\033[1;31mZZZ\033[0mMM   "
echo -e "                         M\033[1;31mZZZ\033[0mNM\033[1;31mZZZZZZZZ\033[0mMMM\033[1;31mZZZZZZZZ\033[0mM\033[1;31mZZZZ\033[0mMZ   "
echo -e "                         M\033[1;31mZZZ\033[0mMM\033[1;31mZZZZZZZ\033[0mNMMMM\033[1;31mZZZZZZZ\033[0mM8\033[1;31mZZZ\033[0mMM  "
echo -e "                         M\033[1;31mZZZ\033[0mMMMD\033[1;31mZZZZ\033[0mMM8OOMMN\033[1;31mZZZ\033[0mDMMMZZ\033[0mDM+    "
echo -e "                         OMZMMMMMMMMM\033[1;31mZZZZZZZ\033[0mNMMMMMMMMOMO                        "
echo -e "                          MMN\033[1;31mZZZ\033[0mDMMM\033[1;31mZZZZZZZZZ\033[0mMMM\033[1;31mZZZZ\033[0mOMM       "
echo -e "                          ,M8\033[1;31mZZZZZ\033[0mMM\033[1;31mZZZZZZZZZ\033[0mMM\033[1;31mZZZZZZ\033[0mM,  "
echo -e "                           MN\033[1;31mZZZZZ\033[0m8MD\033[1;31mZZZZZZZZ\033[0mM\033[1;31mZZZZZZZ\033[0mM   "
echo -e "                           OM\033[1;31mZZZZZZ\033[0mMMO\033[1;31mZZZZZ\033[0mOMM\033[1;31mZZZZZZ\033[0mMO    "
echo -e "                             M8\033[1;31mZZZZ\033[0mMMMMMMMMMMM\033[1;31mZZZZ\033[0m8M8   "
echo -e "                              MMMMMMMNO\033[1;31mZZZZ\033[0mDMMMNMMM               "
echo -e "                                IMMM\033[1;31mZZZZZZZZZ\033[0mMMMM                "
echo -e "                                   OMN\033[1;31mZZZZZ\033[0mNMO                  "
echo -e "                                     ZMMMMMO                                     ";
echo -e "\n";
echo -e "\033[1;31m          _,met\$\$\$\$\$gg.";
echo -e "       ,g\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$P.";
echo -e "     ,g\$\$P\"\"       \"\"\"Y\$\$.\".";
echo -e "    ,\$\$P'              \`\$\$\$.";
echo -e "  ',\$\$P       ,ggs.     \`\$\$b:";
echo -e "  \`d\$\$'     ,\$P\"'   .    \$\$\$";
echo -e "   \$\$P      d\$'     ,    \$\$P";
echo -e "   \$\$:      \$\$.   -    ,d\$\$'      ";
echo -e "   \$\$;      Y\$b._   _,d\$P'   \033[1;35m     _,           _,      ,'\`.";
echo -e "\033[1;31m   Y\$\$.    \`.\`\"Y\$\$\$\$P\"'\033[1;35m         \`\$\$'         \`\$\$'     \`.  ,'";
echo -e "\033[1;31m   \`\$\$b      \"-.__           \033[1;35m    \$\$           \$\$        \`'";
echo -e "\033[1;31m    \`Y\$\$b                     \033[1;35m   \$\$           \$\$         _,           _";
echo -e "\033[1;31m     \`Y\$\$.                \033[1;35m ,d\$\$\$g\$\$  ,d\$\$\$b.  \$\$,d\$\$\$b.\`\$\$' g\$\$\$\$\$b.\`\$\$,d\$\$b.";
echo -e "\033[1;31m       \`\$\$b.          \033[1;35m    ,\$P'  \`\$\$ ,\$P' \`Y\$. \$\$\$'  \`\$\$ \$\$  \"'   \`\$\$ \$\$\$' \`\$\$";
echo -e "\033[1;31m         \`Y\$\$b.      \033[1;35m     \$\$'    \$\$ \$\$'   \`\$\$ \$\$'    \$\$ \$\$  ,ggggg\$\$ \$\$'   \$\$";
echo -e "\033[1;31m           \`\"Y\$b._     \033[1;35m   \$\$     \$\$ \$\$ggggg\$\$ \$\$     \$\$ \$\$ ,\$P\"   \$\$ \$\$    \$\$";
echo -e "\033[1;31m               \`\"\"\"\"    \033[1;35m  \$\$    ,\$\$ \$\$.       \$\$    ,\$P \$\$ \$\$'   ,\$\$ \$\$    \$\$";
echo -e "\033[1;35m                          \`\$g. ,\$\$\$ \`\$\$._ _., \$\$ _,g\$P' \$\$ \`\$b. ,\$\$\$ \$\$    \$\$";
echo -e "\033[1;35m                           \`Y\$\$P'\$\$. \`Y\$\$\$\$P',\$\$\$\$P\"'  ,\$\$. \`Y\$\$P'\$\$.\$\$.  ,\$\$.";
echo -e "\n";
echo -e "\033[1;33m                        Willkommen bei Raspobot \033[0m";
echo -e "\n";
echo -e "\033[1;34m==============================================================================================="
echo -e "\033[1;33m Debian Verson:      \033[1;31m" `cat /etc/debian_version`
echo -e "\033[1;33m Kernel Version:     \033[1;31m" `uname -srmo`
echo -e "\033[1;33m Rasp-Build-Datum    \033[1;31m" `more /boot/issue.txt | grep '20' | awk '{print $4}'`
echo -e "\033[1;34m==============================================================================================="
echo -e "\033[1;33m Datum:              \033[1;31m" `date +"%A, %e %B %Y, %r"`
echo -e "\033[1;33m Systemzeit:         \033[1;31m" `date | awk '{print $4}'`
echo -e "\033[1;33m Online seit:        \033[1;31m" ${UPTIME}
echo -e "\033[1;34m==============================================================================================="
echo -e "\033[1;33m Free Disk Space SDC:\033[1;31m"  `df -Pk | grep -E '^/dev/root' | awk '{ print $4 }' | awk -F '.' '{ print $1 }'` KB on /dev/root
echo -e "\033[1;33m Disk Usage:         \033[1;31m" `du -sh /home/pi`
echo -e "\033[1;33m Speichernutzung:    \033[1;31m" `cat /proc/meminfo|grep 'MemF'| awk '{print $2/1000}'` "MB (Frei) von" `cat /proc/meminfo|grep 'MemT'| awk '{print $2/1000}'` "MB (Total)"
echo -e "\033[1;33m Load Averages:      \033[1;31m" ${one}, ${five}, ${fifteen} 1, 5, 15 min
echo -e "\033[1;33m Running Processes:  \033[1;31m"  `ps ax | wc -l | tr -d " "`
echo -e "\033[1;33m CPU-Freq:           \033[1;31m"  `sudo cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq | awk '{print $1/1000}'` "Mhz"
echo -e "\033[1;33m CPU-Temp:           \033[1;31m"  `cat /sys/class/thermal/thermal_zone0/temp | awk '{printf("%.1f\n", $1/1000)}'` "°C"
echo -e "\033[1;33m IP Adresse:         \033[1;31m"  $ip `/sbin/ifconfig eth0 | /bin/grep "inet addr" | /usr/bin/cut -d ":" -f 2 | /usr/bin/cut -d " " -f 1` and WAN `wget -q -O - http://icanhazip.com/ | tail`
echo -e "\033[1;33m Weather:            \033[1;31m"  `curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|DE|NRW|GREFRATH" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`
echo -e "\033[1;34m==============================================================================================="
echo -e "\033[1;32mUser     Anschluß     Seit             von"
/usr/bin/who
echo -e "\033[1;34m==============================================================================================="
echo -e "\n";


-----

Webseite:
http://www.forum-raspberrypi.de/Thread-tutorial-ssh-terminal-begruessung
https://www.raspberrypi.org/forums/viewtopic.php?t=23440
https://www.raspberrypi.org/forums/viewtopic.php?f=91&t=23440
___________________________________________________________________________________________________________
