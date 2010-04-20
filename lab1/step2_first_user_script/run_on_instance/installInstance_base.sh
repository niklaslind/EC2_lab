#!/bin/bash -x


LOGFILE=/tmp/installfile.`date +"%Y-%m-%d_%H:%M:%S"`.log

log() {
    echo $1 >> $LOGFILE
}

log "Start install"

#set timezone
cd /etc
mv /etc/localtime /etc/localtime-old
ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime

yes | adduser --disabled-password valtech
log "User valtech created"

sudo apt-get -q -y update
log "apt-get update done"
sudo apt-get -q -y install apache2
log "install done"

