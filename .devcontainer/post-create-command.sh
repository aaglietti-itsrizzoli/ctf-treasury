#!/bin/bash

echo "post-create-command.sh"

sudo cp .devcontainer/tor.list /etc/apt/sources.list.d/

wget -qO- https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | gpg --dearmor | sudo tee /usr/share/keyrings/deb.torproject.org-keyring.gpg >/dev/null

sudo apt update
sudo apt install -y tor deb.torproject.org-keyring apt-transport-https

sudo /etc/init.d/tor restart

.devcontainer/keys.sh
