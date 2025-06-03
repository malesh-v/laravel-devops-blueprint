# PHP Dockerfile
FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip git curl libpng-dev libonig-dev libxml2-dev \
    && docker-php-ext-install pdo_mysql zip mbstring exif pcntl bcmath gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

ENTRYPOINT ["/var/www/html/docker/php/entrypoint.sh"]
CMD ["php-fpm"]
