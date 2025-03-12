#!/bin/bash

mkdir -p ~/.ssh
touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

code ~/.ssh/authorized_keys

sudo apt update
sudo apt-get install -y openssh-server
sudo /etc/init.d/ssh restart

sudo cp torrc /etc/tor/torrc

sudo /etc/init.d/tor restart
