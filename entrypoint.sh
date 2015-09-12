#!/bin/bash
service postgresql restart
service php5-fpm restart
service apache2 restart

cd /code/DeliveryWeb

# Use an existing cache that will be mapped as a volume to avoid re-downloading packages
export COMPOSER_CACHE_DIR=/root/composer/cache
export COMPOSER_HOME=/root/composer
# We use --prefer-dist to download zip files instead of cloning repositories
# this allow caching for "commit" requirements (@dev).
composer install --no-interaction --prefer-dist

# No errors tolerated here!
set -e

# Running migrations
php app/console doctrine:migrations:migrate --no-interaction

# Running PHPUnit
phpunit -c app/phpunit.xml.dist
