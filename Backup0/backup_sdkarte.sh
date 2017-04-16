#!/bin/sh
#===============================================================================
#
#     FILE:           backup_sdkarte.sh
#
#		  AUTHOR:         Helpi
#     EMAIL:          helpi9007@gmail.com
#     CREATED:        12-Apr-2017
#
#     MODIFIED BY:    Helpi
#     MODIFIED DATE:  15-Apr-2017
#
#     DESCRIPTION:    ""
#
#===============================================================================

# Ordnereinstellungen
SUBDIR=sd_FHEM_backups
DIR=/media/Nas/fhem/$SUBDIR

# Soll die Image komprimiert werden? (tar)? (1=Yes, 0=No)
COMPRESS_IMAGE=0

echo "Backupscript für SD-Karte wird gestartet!"

# First check if pv package is installed, if not, install it first
# Als Erstes wird geprüft, ob das Packet pv instaliert ist, falls nicht, wird es instaliert
PACKAGESTATUS=`dpkg -s pv | grep Status`;

if [[ $PACKAGESTATUS == S* ]]
   then
      echo "Package 'pv' ist instaliert."
   else
      echo "Package 'pv' ist nicht Instaliert."
      echo "Installing package 'pv'. Bitte Warten..."
      sudo apt-get -y install pv
fi

# Check if backup directory exists
# Überprüfung ob ein Backup-Ordner exestiert
if [ ! -d "$DIR" ];
   then
      echo "Backup Ordner $DIR nicht vorhanden, Ordner wird erstellt!"
      sudo mkdir $DIR
fi

# Create a filename with datestamp for our current backup (without .img suffix)
# Erstelle eine Datei mit dem aktuellem Datum des Backups (ohne .img Endung)
OFILE="$DIR/backup_sdkart_$(date +%Y%m%d_%H%M%S)"

# Create final filename, with suffix
# Erstellung einer weiteren Datei mit .img
OFILEFINAL=$OFILE.img

# First sync disks
# Ersten Festplaten
sync; sync

# Shut down some services before starting backup process
# Bennden der aktuellen Prozesse, bervor das Backup startet.
echo "Dienste werden beendet, bevor Backup erstellt wird."
sudo service cron stop
sudo service apache2 stop
sudo service mysql stop

# Begin the backup process, should take about 1 hour from 8Gb SD card to HDD
# Begint den Backupvorgang, 8GB SD Karte wird auf die HDD kopiert, dass kann bis zu einer Stunde dauer
echo "Backup wird auf HDD erstellt."
echo "Dies wird einige Zeit, Abhängigkeit von der SD-Karten Größe, in Anspruch nehmen. Bitte warten..."
SDSIZE=`sudo blockdev --getsize64 /dev/mmcblk0`;
sudo pv -tpreb /dev/mmcblk0 -s $SDSIZE | sudo dd of=$OFILE bs=1M conv=sync,noerror iflag=fullblock

# Wait for DD to finish and catch result
# Warten bis der Vorgang abgeschlossen ist und mit welchem Ergebniss
RESULT=$?
echo "Ergebniss: $RESULT"

# Start services again that where shutdown before backup process
# beendete Programme werden wieder gestartet.
echo "Dienste werden wieder gestartet"
sudo service mysql start
sudo service apache2 start
sudo service cron start

# If command has completed successfully, delete previous backups and exit
# Ist der Ergebiss erfolgreich, wird die vorhandene Sicherung gelöscht.
if [ $RESULT = 0 ];
   then
      # should image be compressed (tar)?
      # Ist die Sicherung komprimiert?
      if [ $COMPRESS_IMAGE = 1 ];
         # compress image
         then
            echo "Backup war erfolgreich, vorheriges Backup (tar.gz) wird gelöscht."
            rm -f $DIR/backup_*.tar.gz
            mv $OFILE $OFILEFINAL
            echo "Backup wird gepackt. Please wait..."
            tar zcf $OFILEFINAL.tar.gz $OFILEFINAL
            rm -rf $OFILEFINAL
            echo "SD backup erfolgreich! Datei: $OFILEFINAL.tar.gz"
            exit 0
         # Else remove old images
         else
            echo "Backup war erfolgreich, vorheriges Backup (.img) wird gelöscht."
            rm -f $DIR/backup_*.img
            mv $OFILE $OFILEFINAL
            exit 0
         fi
# Else remove attempted backup file
   else
      echo "Backup fehlgeschlagen! Altes Backup wurde nicht beseitigt."
      echo "Bitte überprüfen Sie, ob genügend Platz auf der Festplatte vorhanden ist."
      rm -f $OFILE
      echo "SD backup Prozess fehlgeschlagen!"
      exit 1
fi
