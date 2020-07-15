#!/bin/sh

# Create the root web directory
mkdir /var/www/localhost

# assign ownership with USER env var
chown -R $USER:$USER /var/www/localhost
