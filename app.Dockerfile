FROM php:7.1-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev mysql-client curl zip \
    && docker-php-ext-install mcrypt pdo_mysql pcntl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www