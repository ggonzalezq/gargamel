FROM php:7.2-apache

RUN apt-get update
#RUN apt-get upgrade -y
RUN docker-php-ext-install pdo pdo_mysql mysqli
#RUN a2enmod rewrite
RUN apt-get install -y vim
RUN echo "alias ll='ls -alF'" >> /root/.bashrc

COPY ./web /var/www/html
COPY ./etc/apache/api-gargamel.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/api-gargamel.conf /etc/apache2/sites-enabled/api-gargamel.conf
COPY ./etc/apache/gargamel.conf /etc/apache2/sites-available/
RUN ln -s /etc/apache2/sites-available/gargamel.conf /etc/apache2/sites-enabled/gargamel.conf

WORKDIR /var/www/html
