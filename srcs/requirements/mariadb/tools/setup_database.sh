#!/bin/sh

mariadbd-safe &

until mariadb -e "SELECT 1" 2>/dev/null
do
	sleep 1
done


mariadb -e "DROP DATABASE IF EXISTS test"
mariadb -e "CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;"
