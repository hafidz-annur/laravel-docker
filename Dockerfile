FROM php:8.2-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql bcmath 

WORKDIR /code

COPY ./src /code/

# Set appropriate permissions for the storage directory and its subdirectories
RUN chown -R www-data:www-data /code/storage && \
    chmod -R 775 /code/storage