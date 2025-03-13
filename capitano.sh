#!/bin/bash

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

code ~/.ssh/authorized_keys

sudo apt update

# export UCF_FORCE_CONFFNEW=1
# export DEBIAN_FRONTEND=noninteractive
# --force-confask --force-confdef --force-confold ...
# sudo apt-get -o Dpkg::Options::=--force-confnew install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages openssh-server
# hammer just works
sudo apt-get purge -y openssh-server
sudo apt-get install -y openssh-server

sudo /etc/init.d/ssh restart

sudo cp torrc /etc/tor/torrc

sudo /etc/init.d/tor restart

.devcontainer/treasures.sh

echo "##########################"
echo ""
TOR_HOSTNAME=`sudo cat ./hs/hostname`

echo "TEAM ${CODESPACE_NAME}: ${TOR_HOSTNAME}"
