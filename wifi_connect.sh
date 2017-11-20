<<<<<<< HEAD
#!/bin/bash
#======================================== ==================================
#     FILE:             wifi_connect.sh
#     AUTHOR:           Helpi_Stone
#     EMAIL:            helpi9007@gmail.com
#     CREATED:          2017-11-19
#
#     MODIFIED BY:      Helpi_Stone
#     MODIFIED DATE:    2017-11-19
#
#     DESCRIPTION:      "Beschreibung"
#
#     VERSION:           1.0
#======================================== ==================================
# Ping to the router
ping -c2 192.168.2.1 > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]; then
    # Restart the wireless interface
    #/sbin/ifdown wlan0; sleep 5; /sbin/ifup --force wlan0
    ifdown --force wlan0
    sleep 5
    ifup wlan0
    echo "wlan0 reconnected at `date`"
fi
=======
#!/bin/bash
#======================================== ==================================
#     FILE:             wifi_connect.sh
#     AUTHOR:           Helpi_Stone
#     EMAIL:            helpi9007@gmail.com
#     CREATED:          2017-11-19
#
#     MODIFIED BY:      Helpi_Stone
#     MODIFIED DATE:    2017-11-19
#
#     DESCRIPTION:      "Beschreibung"
#
#     VERSION:           1.0
#======================================== ==================================
# Ping to the router
ping -c2 192.168.2.1 > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]; then
    # Restart the wireless interface
    ifdown --force wlan0
    sleep 5
    ifup wlan0
    echo "wlan0 reconnected at `date`"
fi
>>>>>>> origin/master
