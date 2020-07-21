#!/bin/sh

if ! cmp -s /etc/nginx/sites-enabled/localhost localhost_domain_off
then
	echo "index OFF"
	cp localhost_domain_off /etc/nginx/sites-enabled/localhost
	cp /var/www/html/index.nginx-debian.html /var/www/localhost/index.html
elif ! cmp -s /etc/nginx/sites-enabled/localhost localhost_domain
then
	echo "index ON"
	cp localhost_domain /etc/nginx/sites-enabled/localhost
	rm -r /var/www/localhost/index.html
fi

service nginx reload
service nginx restart
