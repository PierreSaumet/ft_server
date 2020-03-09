FROM debian:latest

RUN echo "hello"
RUN apt-get update && apt-get update -y
RUN apt-get install -y nginx && apt-get install -y mysql-client
# phpmyadmin/phpmyadmin wordpress -y
