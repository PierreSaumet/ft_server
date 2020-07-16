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

bash db_script.sh

service nginx reload
service nginx configtest
service nginx start
service nginx status

/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm status

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
