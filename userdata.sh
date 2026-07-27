#!/bin/bash

apt update -y

apt install apache2 -y

apt install php php-mysql libapache2-mod-php wget unzip -y

systemctl enable apache2

systemctl start apache2

cd /tmp

wget https://wordpress.org/latest.tar.gz

tar -xzf latest.tar.gz

cp -r wordpress/* /var/www/html/

chown -R www-data:www-data /var/www/html/

chmod -R 755 /var/www/html/

systemctl restart apache2
