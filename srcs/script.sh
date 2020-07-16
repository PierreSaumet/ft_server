#!/bin/sh

# Create the root web directory
mkdir /var/www/localhost


# Put localhost_domain's file into sites-available/localhost
cp localhost_domain /etc/nginx/sites-available/localhost

# Put info.php file into localhost directory
cp info.php /var/www/localhost/info.php

#  Assign ownership with USER env var
chown -R $USER:$USER /var/www/localhost

# Activate config by linking
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# nginx -t

service nginx reload
service nginx configtest
service nginx start
service nginx status

