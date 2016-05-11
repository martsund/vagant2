#!/usr/bin/env bash

echo "Installing Apache and setting it up..."
apt-get update >/dev/null 2>&1
apt-get install -y apache2 >/dev/null 2>&1
rm -rf /var/www
ln -fs /vagrant /var/www


# Install PHP
apt-get -y install php5 apache2 libapache2-mod-php5 php5-curl php5-gd php5-mcrypt php5-mysql php-apc > /dev/null 2>&1

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/martsund/vagant2/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/martsund/vagant2/master/files/info.php
 