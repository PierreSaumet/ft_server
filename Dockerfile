# OS debian buster
FROM debian:buster-slim

# Credits
MAINTAINER Psaumet <psaumet@student.42.fr>

RUN echo "hello"

RUN apt-get update

RUN apt-get install -y wget

RUN mkdir srcs

WORKDIR srcs

ADD http://fr.wordpress.org/latest-fr_FR.tar.gz /srcs

RUN tar -xzvf latest-fr_FR.tar.gz

RUN echo "OK"

