#!/bin/sh

#
# Ubuntu Equip
#  MongoDB 3 Equip
# Licence: MIT

sudo sh -c 'echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list'

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo apt-get update -y

if (( "$#" == 1 )); then
  # Assuming $1 is version parameter
  sudo apt-get install mongodb-org=$1 mongodb-org-server=$1 mongodb-org-shell=$1 mongodb-org-mongos=$1 mongodb-org-tools=$1 -y
else
  sudo apt-get install mongodb-org -y
fi

# Cleanup
rm -f equip_mongodb3.sh
