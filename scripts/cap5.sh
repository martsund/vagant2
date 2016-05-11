#!/bin/bash

# Update CentOS with any patches 
apt-get update -y --exclude=kernel

# Tools
apt-get install -y nano git unzip screen

# Apache
apt-get install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
apt-get install -y php php-cli php-common php-devel php-mysql

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/martsund/vagant2/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/martsund/vagant2/master/files/info.php
service httpd restart 