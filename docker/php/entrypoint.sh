#!/bin/sh

# Set permissions
echo "Setting permissions..."
chmod -R 775 storage bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache

echo "Running artisan storage:link..."
php artisan storage:link || true

echo "Running migrations..."
php artisan migrate --force || true

# Launch the main process
exec "$@"
