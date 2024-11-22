FROM php:8.2-fpm-alpine

RUN apk update && apk add openssl zip unzip git

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /code

COPY ./src /code

RUN composer install

RUN cp .env.example .env

RUN php artisan key:generate