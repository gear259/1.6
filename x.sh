#!/bin/bash
#
sudo apt-get update && apt-get upgrade -y && apt-get install lsb-release nscd curl nano php5 php5-mysql php5-cli php5-curl unzip screen build-essential -y && apt-get install php5-mcrypt && php5enmod mcrypt

sudo service apache2 restart

cd /var/www/html

wget http://kodi.ps/iptv/x1060.tar.gz

tar -xvzf x1060.tar.gz

wget http://127.0.0.1/downloads/iptv_panel_pro.zip -O /tmp/iptv_panel_pro.zip

cd /root

wget http://127.0.0.1/downloads/install_iptv_pro.zip

unzip install_iptv_pro.zip
cd
sudo php install_iptv_pro.php

sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"

sudo /sbin/iptables -t nat -A OUTPUT -p tcp --dport 80 -j DNAT --to-destination 127.0.0.1:80
sudo /sbin/iptables -t nat -A OUTPUT -p tcp --dport 443 -j DNAT --to-destination 127.0.0.1:443
