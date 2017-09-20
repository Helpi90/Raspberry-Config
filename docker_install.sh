#!/bin/bash
#======================================== ==================================
#     FILE:                                docker_install.sh
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
#Would you love to get Docker up and running on you Raspberry Pi 2? Fortunately someone already did most of the leg work for you, as you will see from the article "Kick-Ass Raspberry Pi 2 having a forbidden love affair with Docker 1.4.1".

Check the official article "Installing Operating System Images" for more information on how to install this Debian Wheezy OS.

After you have downloaded and installed the image referenced in the article you're ready to do some adjustments to improve security.

Create a user

Log in as root to create a personal user and give it a password:

adduser myname
Add the new user to the docker and sudo groups

usermod -G docker,sudo myname
Putting your user into the docker group allows you to run Docker without sudo. Restart the Docker daemon to make it take effect without a reboot:

service docker restart
Now install the sudo package:

apt-get update && apt-get install sudo
Disable root SSH access

You're now ready to log in as myname. As myname modify /etc/ssh/sshd_config (for example using sudo vi to make sure the following line is present:

PermitRootLogin no
Restart the ssh daemon to make it take effect:

sudo service ssh restart
To disable root login all together (after all you have sudo, right?) you can lock the root account's password:

sudo passwd -l root
Test Docker

Log in as myname and test that Docker works:

docker run -t --rm resin/rpi-raspbian echo 'success!'
Using Docker images

Most images on Docker Hub cannot run on Raspberry Pi's ARM processor. Search for images whose names start with rpi or contains armv7, armv7hf, or armv7l.

Enjoy!
