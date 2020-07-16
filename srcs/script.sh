#!/bin/sh

# Create the root web directory
mkdir /var/www/localhost


# Put localhost_domain's file into sites-available/localhost
cp localhost_domain /etc/nginx/sites-available/localhost

# Put info.php file into localhost directory
# TEST cp info.php /var/www/localhost/info.php

#  Assign ownership with USER env var
chown -R $USER:$USER /var/www/localhost

# Activate config by linking
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# nginx -t


cp -r wordpress /var/www/localhost/wordpress
cp -r phpMyAdmin /var/www/localhost/phpMyAdmin

#bash db_wordpress.sql
echo 'TEST de la commande db_name ...\n'
# service mysql start
echo 'on rend  excecutable'
chmod 755 db_script.sh
echo 'on lance avec les arguments'
bash db_script.sh wordpress db_user db_pwd


# RTUC CHELOU
echo 'truc chelou'
# mysql wordpress -u root < /root/db_wordpress.sql
# fin truc chelou
echo 'Fin de la commande \n'

chown -R www-data:www-data /var/www


echo 'Test du ssl ...'
cd ssl
chmod +x mkcert
./mkcert -install
./mkcert localhost
cd ..
echo 'Fin du test ssl!'


service nginx reload
service nginx configtest
service nginx start
service nginx status

/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm status

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
