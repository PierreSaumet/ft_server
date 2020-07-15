#!/bin/sh

# Create the root web directory
mkdir /var/www/localhost


# Put localhost_domain's file into sites-available/localhost
cp localhost_domain /etc/nginx/sites-available/localhost

#  Assign ownership with USER env var
chown -R $USER:$USER /var/www/localhost

# Activate config by linking
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

nginx -t
