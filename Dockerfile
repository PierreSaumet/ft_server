# OS debian buster
FROM debian:buster-slim

# Credits
MAINTAINER Psaumet <psaumet@student.42.fr>

RUN echo "hello"

RUN apt-get update

RUN apt-get install -y mariadb-server \ 
				wget

RUN mkdir srcs

WORKDIR srcs

# Download wordpress and phpMyAdmin to put them into the directory srcs
# Attention se fait a build
ADD http://fr.wordpress.org/latest-fr_FR.tar.gz /srcs
ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz /srcs

# Extract the files phpMyAdmin and wordpress
RUN tar -xzvf phpMyAdmin-4.9.0.1-all-languages.tar.gz 
RUN tar -xzvf latest-fr_FR.tar.gz


# Delete useless files
RUN rm -rf latest-fr_FR.tar.gz \ rm -rf phpMyAdmin-4.9.0.1-all-languages.tar.gz

# Rename
RUN mv /srcs/phpMyAdmin-4.9.0.1-all-languages /srcs/phpMyAdmin

RUN echo "OK"

