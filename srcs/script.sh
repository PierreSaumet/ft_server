#!/bin/sh

# Variables used for better graphics
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Create the root web directory
echo -e "${RED}Step 1: ${NC}Create localhost directory and copy localhost_domain in it"
mkdir /var/www/localhost

# Put localhost_domain's file into sites-available/localhost
cp localhost_domain /etc/nginx/sites-available/localhost


# Assign ownership with USER environment variable
echo -e "${RED}Step 2: ${NC}Assign localhost to User's variable"
chown -R $USER:$USER /var/www/localhost

# Activate config by linking
echo -e "${GREEN}Linking localhost to sites-enables${NC}"
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

# Copy the Wordpress and PhpMyAdmin directories
echo -e "${RED}Step 3: ${NC}Copy the Wordpress and phpMyadmin"
cp -r wordpress /var/www/localhost/wordpress
cp -r phpMyAdmin /var/www/localhost/phpMyAdmin

# Make excecutable the database's file
echo -e "${GREEN} Chmod db.script.sh ${NC}"
chmod 755 db_script.sh

# Create Database
echo -e "${RED}Step 4: ${NC} Create Database with the name: wordpress, User: wordpress and the Password: password. And incorporate database"
bash db_script2.sh

# Give right for Wordpress's connection
echo -e "${GREEN} Allow's Wordpress to write${NC}"
chown -R www-data:www-data /var/www

# Use mkcert for the SSl's key
echo -e "${RED}Step 5: ${NC} Create SSL's key to allow localhost"
cd ssl
chmod +x mkcert
./mkcert -install
./mkcert localhost
cd ..

# Reload, then start the nginx's server
echo -e "${RED}Step 6: ${NC} Nginx... "
service nginx reload
service nginx configtest
service nginx start
service nginx status

# Start phpMyAdmin
echo -e "${RED}Step 7: ${NC}phpMyAdmin" 
/etc/init.d/php7.3-fpm start
/etc/init.d/php7.3-fpm status


echo "+-------------------------+"
echo -e "|${RED}Every thing is working...${NC}|"
echo "+-------------------------+"

# Show "errors.log" and "access.log"
echo -e "DISPLAY: ${YELLOW}error${NC} and ${BLUE} access ${NC}"
 tail -f /var/log/nginx/access.log /var/log/nginx/error.log
