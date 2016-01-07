#!/bin/sh

#
# Ubuntu Locale UTF 8
# Set Locale EN_US UTF 8
# Licence: MIT
# to run: wget --no-check-certificate https://github.com/furkanvarol/ubuntu-equip/raw/master/equip_locale_utf8.sh && bash equip_locale_utf8.sh

export LC_ALL="en_US.UTF-8"
sudo sh -c 'echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/default/locale'
sudo locale-gen en_US en_US.UTF-8
sudo dpkg-reconfigure locales

echo "Local is set to en_US.UTF8"
