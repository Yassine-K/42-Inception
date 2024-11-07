#!/bin/bash

/etc/init.d/mariadb start

mariadb -e "CREATE DATABASE $DB_NAME;
			 CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
			 GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
			 FLUSH PRIVILEGES;"

/etc/init.d/mariadb stop

exec mysqld -u mysql