FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git unzip curl libpng-dev libonig-dev libxml2-dev zip libzip-dev mariadb-client nginx supervisor gettext-base \
    && docker-php-ext-install pdo_mysql mbstring zip exif pcntl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY ./laravel-app /var/www/html
COPY ./docker/php/local.ini /usr/local/etc/php/conf.d/local.ini

RUN mkdir -p bootstrap/cache storage && \
    chown -R www-data:www-data bootstrap/cache storage && \
    chmod -R 775 bootstrap/cache storage

RUN composer install --no-dev --optimize-autoloader
RUN php artisan config:clear

COPY ./docker/nginx/single-container/default.conf /etc/nginx/conf.d/default.conf

COPY ./docker/nginx/single-container/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN sed -i 's|listen = .*|listen = 9000|' /usr/local/etc/php-fpm.d/www.conf

ENV PORT=8080

RUN envsubst '${PORT}' < /etc/nginx/conf.d/single-container.conf.template > /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["/usr/bin/supervisord", "-n"]
