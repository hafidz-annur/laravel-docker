FROM php:8.2-fpm-alpine

RUN apk add --no-cache \
    git \
    curl \
    bash \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    freetype-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    --with-webp \
    && docker-php-ext-install pdo pdo_mysql bcmath gd

RUN docker-php-ext-install pdo pdo_mysql bcmath 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /code

COPY ./src /code/

# Set appropriate permissions for the storage directory and its subdirectories
RUN chown -R www-data:www-data /code/storage && \
    chmod -R 775 /code/storage