#!/bin/bash
service postgresql restart
service php5-fpm restart
service apache2 restart

cd /code/DeliveryWeb

# Use an existing cache that will be mapped as a volume to avoid re-downloading packages
export COMPOSER_CACHE_DIR=/root/composer/cache
export COMPOSER_HOME=/root/composer
composer install --no-interaction

# Creating the database
sudo -u postgres psql -c "create user vagrant with password 'vagrant'"
sudo -u postgres psql -c "create database symfony"

# No errors tolerated here!
set -e

# Running migrations
php app/console doctrine:migrations:migrate --no-interaction

# Running PHPUnit
phpunit -c app/phpunit.xml.dist
