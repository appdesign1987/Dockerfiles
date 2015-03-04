#A basic apache server. To use either add or bind mount content under /var/www
FROM debian:latest

MAINTAINER Jeroen van Drongelen 0.1

RUN apt-get update && apt-get install -y apache2 php5 libapache2-mod-php5 && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]