#!/usr/bin/env bash
# install files in the home of user "Pi"
cd /home/pi
# install packages
apt-get install git bc i2c-tools python python-imaging python-smbus python-dateutil -y
# install pip
echo -e "Installing pip";
curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python2.7
# install paho mqtt
echo -e "Installing paho-mqtt";
pip install paho-mqtt
# enable SPI and I2C
raspi-config nonint do_spi 0
raspi-config nonint do_i2c 0
# install papirus-mqtt
wget -q https://goo.gl/dr5I7u -O /home/pi/papirus-mqtt.py && chmod +x /home/pi/papirus-mqtt.py
# install papirus/gratis
git clone https://github.com/PiSupply/PaPiRus.git
cd PaPiRus
# Install PaPirRus python library
python setup.py install
# Install drivers and setup epaper
papirus-setup
# reboot
whiptail --msgbox "The system will now reboot" 8 40
reboot