FROM php:5.6-apache

RUN sed -i \
      's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/web|' \
      /etc/apache2/apache2.conf

RUN usermod -u 1000 www-data

RUN a2enmod rewrite

RUN docker-php-ext-install mysqli pdo_mysql

RUN apt-get update -qq
RUN apt-get install -qq libyaml-dev mysql-client libz-dev libmemcached-dev
RUN echo | pecl install --ignore-errors yaml xdebug memcache memcached
