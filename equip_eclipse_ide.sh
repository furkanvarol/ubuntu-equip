#!/bin/sh

#
# Ubuntu Equip 
# Eclipse IDE (latest version Luna https://eclipse.org/downloads/)
# Licence: MIT
# to run: wget --no-check-certificate https://github.com/resilva87/ubuntu-equip/raw/master/equip_eclipse_ide.sh && bash equip_eclipse_ide.sh

if [ -d "/opt/eclipse" ]; then
	echo "Eclipse already installed in /opt/eclipse, skipping!"
	exit 0
fi

VERSION="eclipse-jee-luna-SR1a-linux-gtk-x86_64.tar.gz"
LINK="http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/luna/SR1a/$VERSION"

echo $VERSION
echo $LINK

wget --no-check-certificate https://github.com/resilva87/ubuntu-equip/raw/master/equip_base.sh && bash equip_base.sh#
wget --no-check-certificate "$LINK"

mv eclipse-jee-luna-SR1a-linux-gtk-x86_64.tar.gz eclipse.tar.gz

# Will copy to /opt
cd /opt/ && sudo tar -zxvf ~/Downloads/eclipse.tar.gz

# Cleanup
rm ~/Downloads/eclipse.tar.gz
rm -f equip_base.sh 
rm -f equip_eclipse_ide.sh

echo "Installed in /opt/eclipse"
