# OS debian buster
FROM debian:buster-slim

# Credits
MAINTAINER Psaumet <psaumet@student.42.fr>

# Update Debian
RUN apt-get update

# Install nginx
RUN apt-get -y install nginx

# Install Mariadb et wget
RUN apt-get install -y mariadb-server 	\ 
				wget

# Install all packets for php
RUN apt-get install -y php 	\
				php-fpm 	\
				php-mysql 	\
				php-mbstring

# Copy all files into root direcotry
COPY srcs ./root/

# Work in root directory
WORKDIR root

#ENTRYPOINT ["bash", "script.sh"]
CMD ["bash", "script.sh"]
