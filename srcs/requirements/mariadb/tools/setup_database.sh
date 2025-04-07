#!/bin/sh

mariadbd-safe &

until mariadb -e "SELECT 1" 2>/dev/null
do
	sleep 1
done


mariadb -e "DROP DATABASE IF EXISTS test;"
mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;"
mariadb -e "CREATE USER '$WP_DATABASE_USER'@'%' IDENTIFIED BY '$WP_DATABASE_PASSWORD';"
mariadb -e "GRANT ALL ON $WP_DATABASE_NAME.* TO '$WP_DATABASE_USER';"
mariadb -e "FLUSH PRIVILEGES;"
# mariadb -e "ALTER USER '$WP_DATABASE_ROOT'@'localhost' IDENTIFIED BY '$WP_DATABASE_ROOT_PASSWORD'r
