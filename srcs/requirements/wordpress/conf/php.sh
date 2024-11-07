#!/bin/bash

cd /var/www/html/

wp core download --allow-root

wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --skip-check --allow-root

wp db check --host=$DB_HOST --dbuser=$DB_USER --dbpass=$DB_PASS --allow-root

wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL   --allow-root

exec php-fpm8.2 -F