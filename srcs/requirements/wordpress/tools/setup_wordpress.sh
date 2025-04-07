#!/bin/sh

echo "Running setup_wordpress.sh"
sleep 5

#configure wordpress
wp config create --path=/var/www/wordpress \
	--dbname=$WP_DATABASE_NAME \
	--dbuser=$WP_DATABASE_USER \
	--dbpass=$WP_DATABASE_PASSWORD \
	--dbhost=$WP_DATABASE_HOST

wp core install --path=/var/www/wordpress \
	--url=$WP_URL \
	--title="$WP_TITLE" \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email 

wp user create --path=/var/www/wordpress iury iury@fake.com --role=author

wp theme install twentytwentytwo --path=/var/www/wordpress --activate

php-fpm83 -F
