#!/bin/sh

#
# Ubuntu Equip
# Maven 3 (version 3.3.9 http://maven.apache.org/download.cgi)
# Licence: MIT
# to run: wget --no-check-certificate https://github.com/furkanvarol/ubuntu-equip/raw/master/equip_maven3.sh && bash equip_maven3.sh [version]

if [ -d "/opt/maven" ]; then
  echo "Maven already installed in /opt/maven, skipping!"
  rm -f equip_maven3.sh
  exit 0
fi

VERSION="3.3.9"

if (( "$#" == 1 )); then
  VERSION=$1
fi

FILENAME="apache-maven-$VERSION-bin.tar.gz"
LINK="http://ftp.unicamp.br/pub/apache/maven/maven-3/$VERSION/binaries/$FILENAME"

echo "$LINK"

wget --no-check-certificate "$LINK"

mkdir maven
tar -zxvf $FILENAME -C maven --strip-components 1

# Will copy to /opt
sudo mv maven /opt/

# Linking to usr bin
sudo ln -s /opt/maven/bin/mvn /usr/bin/mvn

# Cleanup
rm -f $FILENAME
rm -f equip_maven3.sh

echo "Installed in /opt/maven"
