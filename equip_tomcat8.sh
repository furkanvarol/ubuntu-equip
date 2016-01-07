#!/bin/sh

#
# Ubuntu Equip
# Tomcat 8 (latest version 8.0.30 http://tomcat.apache.org/download-80.cgi)
# Licence: MIT
# to run: wget --no-check-certificate https://github.com/furkanvarol/ubuntu-equip/raw/master/equip_tomcat8.sh && bash equip_tomcat8.sh [version]

if [ -d "/opt/tomcat" ]; then
  echo "Tomcat already installed in /opt/tomcat, skipping!"
  rm -f equip_tomcat8.sh
  exit 0
fi

VERSION="8.0.30"

if (( "$#" == 1 )); then
  VERSION=$1
fi

FILENAME="apache-tomcat-$VERSION.tar.gz"
LINK="http://www.eu.apache.org/dist/tomcat/tomcat-8/v$VERSION/bin/$FILENAME"

echo "$LINK"

wget --no-check-certificate "$LINK"

mkdir tomcat
tar -zxvf $FILENAME -C tomcat --strip-components 1

# Will copy to /opt
sudo mv tomcat /opt/

# Cleanup
rm -f $FILENAME
rm -f equip_tomcat8.sh

# Create Tomcat User
sudo groupadd tomcat
sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

# Updating Permissions

cd /opt/tomcat

sudo chgrp -R tomcat conf
sudo chmod g+rwx conf
sudo chmod g+r conf/*

sudo chown -R tomcat work/ temp/ logs/

# Exporting Catalina Home
sudo sh -c 'export "CATALINE_HOME=/opt/tomcat" >> ~/.bashrc'
source ~/.bashrc

# Configuring Tomcat Web Management Interface

sudo sh -c 'echo "<tomcat-users>
    <user username=\"admin\" password=\"password\" roles=\"manager-gui,admin-gui\"/>
</tomcat-users>" > /opt/tomcat/conf/tomcat-users.xml'

echo "Installed in /opt/tomcat"
