FROM php:7.2-apache

RUN apt-get update
#RUN apt-get upgrade -y
RUN docker-php-ext-install pdo pdo_mysql mysqli
#RUN a2enmod rewrite
RUN apt-get install -y vim
RUN echo "alias ll='ls -alF'" >> /root/.bashrc

COPY ./www /var/www/html
COPY ./etc/apache/000-default.conf /etc/apache2/sites-available/

WORKDIR /var/www/html
