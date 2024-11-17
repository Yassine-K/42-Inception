#!/bin/bash

cd /var/www/html/

wp core download --allow-root

wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --skip-check --allow-root

while ! mariadb -u $DB_USER  -p$DB_PASS -h $DB_HOST -e "USE $DB_NAME"; do sleep 2 
done

wp core install --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL   --allow-root

wp user create $WP_USER $WP_MAIL --role=editor --user_pass=$WP_PASS --allow-root

exec php-fpm8.2 -F