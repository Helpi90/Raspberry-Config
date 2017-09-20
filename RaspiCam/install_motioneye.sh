#!/bin/bash
#======================================== ==================================
#     FILE:                                install_motioneye.sh
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
#
## upgrade raspi-config
sudo raspi-config

# Install all the essentails required to get motioneye working.
# The command fails as ffmpeg does not exist on rpi repository, so you need to download and build it from scratch
apt-get install build-essential autoconf libjpeg-dev libavformat-dev libavcodec-dev libswscale-dev ffmpeg subversion git
sudo apt-get install build-essential autoconf libjpeg-dev libavformat-dev libavcodec-dev libswscale-dev ffmpeg subversion git


# Install ffmpeg source and compile
cd /usr/src/
sudo git clone git://source.ffmpeg.org/ffmpeg.git
sudo git clone git://git.videolan.org/x264

# First x264. All commands have sudo, as i don't prefer sudo -su
cd x264/
sudo ./configure --host=arm-unknown-linux-gnueabi --enable-static --disable-opencl
sudo make
sudo make install

# Now fmpeg
cd ../ffmpeg/
sudo ./configure --arch=armel --target-os=linux --enable-gpl --enable-libx264 --enable-nonfree

# On Pi2, use all 4 cores of the Pi
sudo make -j4
sudo make --install
sudo make install

sudo apt-get install build-essential autoconf libjpeg-dev libavformat-dev libavcodec-dev libswscale-dev git

# now compiling motioneye
sudo git clone https://github.com/Mr-Dave/motion.git motion
cd motion/
sudo ./configure --prefix=/usr --with-ffmpeg=/usr/lib/arm-linux-gnueabihf  --with-ffmpeg-headers=/usr --without-pgsql --without-sdl --without-sqlite3 --without-mysql
sudo autoreconf
sudo ./configure --prefix=/usr --with-ffmpeg=/usr/lib/arm-linux-gnueabihf  --with-ffmpeg-headers=/usr --without-pgsql --without-sdl --without-sqlite3 --without-mysql
sudo make -j 4
sudo make install

# test motion, ffmpeg
motion
ffmpeg

# python upgrade (2.7)
sudo apt-get install python-pip python-dev libssl-dev libcurl4-openssl-dev libjpeg-dev
sudo pip install motioneye

sudo mkdir -p /etc/motioneye
sudo cp /usr/local/share/motioneye/extra/motioneye.conf.sample /etc/motioneye/motioneye.conf
sudo mkdir -p /var/lib/motioneye

sudo cp /usr/local/share/motioneye/extra/motioneye.systemd-unit-local /etc/systemd/system/motioneye.service

# to figoure out the changes to be made here, read the documentation.
sudo vim /etc/motioneye/motioneye.conf
