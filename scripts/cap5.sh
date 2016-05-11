#!/bin/bash

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/martsund/vagant2/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/martsund/vagant2/master/files/info.php
service httpd restart 