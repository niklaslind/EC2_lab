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
sudo apt-get -q -y install git-core
#sudo apt-get -q -y install openssh-blacklist openssh-blacklist-extra


sudo apt-get -y install debconf-utils
echo 'sun-java6-bin   shared/accepted-sun-dlj-v1-1    boolean true
sun-java6-jdk   shared/accepted-sun-dlj-v1-1    boolean true
sun-java6-jre   shared/accepted-sun-dlj-v1-1    boolean true
sun-java6-jre   sun-java6-jre/stopthread        boolean true
sun-java6-jre   sun-java6-jre/jcepolicy note
sun-java6-bin   shared/present-sun-dlj-v1-1     note#
sun-java6-jdk   shared/present-sun-dlj-v1-1     note
sun-java6-jre   shared/present-sun-dlj-v1-1     note
'|debconf-set-selections
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -y install sun-java6-jdk


#yes 'yes' | sudo apt-get -q -y install sun-java6-jdk 
#update-java-alternatives --list

sudo apt-get -q -y install inadyn
sudo apt-get -q -y install tomcat6
sudo apt-get -q -y install maven2

#inadyn did not work well as a service. A Job is good enough for this environment
#inadyn --username vhs-searchweb --password pr10ritera --update_period_sec 30 --alias vhs-dev01.dyndns.org &

log "install done"

