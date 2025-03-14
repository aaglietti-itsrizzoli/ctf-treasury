#!/bin/bash

sudo apt-get install -y apache2 libapache2-mod-python

sudo rm -Rf .devcontainer/cc.db

sudo rm -Rf /var/www/html/cc
sudo mkdir -p /var/www/html/cc
sudo cp .devcontainer/.htaccess /var/www/html/cc/.htaccess

sudo cp .devcontainer/index.py /var/www/html/cc/index.py
sudo chmod +x /var/www/html/cc/index.py

sudo cp .devcontainer/cc.html /var/www/html/index.html
sudo cp .devcontainer/jquery-3.7.1.min.js /var/www/html/jquery-3.7.1.min.js

sudo cp .devcontainer/000-default.conf /etc/apache2/sites-available/000-default.conf

sudo a2enmod rewrite python
sudo /etc/init.d/apache2 restart
