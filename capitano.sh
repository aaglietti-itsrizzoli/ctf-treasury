#!/bin/bash

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

code ~/.ssh/authorized_keys

sudo apt update

export UCF_FORCE_CONFFNEW=1
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -o Dpkg::Options::=--force-confnew install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages openssh-server

sudo /etc/init.d/ssh restart

sudo cp torrc /etc/tor/torrc

sudo /etc/init.d/tor restart

.devcontainer/treasures.sh
