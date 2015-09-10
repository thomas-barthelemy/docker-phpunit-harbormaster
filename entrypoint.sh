#!/bin/bash
service postgresql restart
service php5-fpm restart
service apache2 restart

cd /code/DeliveryWeb
export COMPOSER_CACHE_DIR=/root/composer/cache
export COMPOSER_HOME=/root/composer
composer install --no-interaction

sudo -u postgres psql -c "create user vagrant with password 'vagrant'"
sudo -u postgres psql -c "create database symfony"

php app/console doctrine:migrations:migrate --no-interaction

phpunit -c app/phpunit.xml.dist

