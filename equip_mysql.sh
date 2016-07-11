#!/bin/sh

#
# Ubuntu Equip
#  MySQL Equip (user: root, pass: root)
# Licence: MIT

rootpass=${1:-"root"}

echo "mysql-server mysql-server/root_password password $rootpass" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $rootpass" | sudo debconf-set-selections
sudo apt-get -y install mysql-server

# Cleanup
rm -f equip_mysql.sh
