#!/bin/sh

#configure wordpress
wp config create --path=/var/www/wordpress \
	--dbname=$WP_DATABASE_NAME \
	--dbuser=$WP_DATABASE_USER \
	--dbpass=$WP_DATABASE_PASSWORD \
	--dbhost=$WP_DATABASE_HOST &&\
wp core install --path=/var/www/wordpress \
	--url=$WP_URL \
	--title="$WP_TITLE" \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--skip-email && \
#redis and theme
wp plugin install redis-cache --activate --path=/var/www/wordpress && \
wp config --path=/var/www/wordpress set WP_REDIS_HOST $REDIS_HOST && \
wp config --path=/var/www/wordpress set WP_REDIS_PORT $REDIS_PORT && \
wp redis enable --all --path=/var/www/wordpress && \
wp theme install twentytwentytwo --path=/var/www/wordpress --activate
# wp plugin activate redis-cache --path=/var/www/wordpress

wp user create --path=/var/www/wordpress iury iury@fake.com --role=author

php-fpm83 -F
