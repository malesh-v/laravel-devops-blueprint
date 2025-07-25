FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git unzip curl libpng-dev libonig-dev libxml2-dev zip libzip-dev mariadb-client \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY ./laravel-app /var/www/html

COPY ./docker/php/local.ini /usr/local/etc/php/conf.d/local.ini

RUN mkdir -p bootstrap/cache \
    && chown -R www-data:www-data bootstrap/cache \
    && chmod -R 775 bootstrap/cache

RUN composer install --no-dev --optimize-autoloader

RUN php artisan config:clear

EXPOSE 9000

CMD ["php-fpm"]
