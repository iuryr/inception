#!/bin/ash

#Download wordpress
# curl -LO https://wordpress.org/latest.tar.gz &&\
# 	tar xvf latest.tar.gz
# rm -rf latest.tar.gz

#Download wordpress cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#configure wordpress
wp config create --path=/var/www/wordpress \
	--dbname=$WP_DATABASE_NAME \
	--dbuser=$WP_DATABASE_USER \
	--dbpass=$WP_DATABASE_PASSWORD \
	--dbhost=mariadb

wp core install --path=/var/www/wordpress \
	--url=teste.com \
	--title=titulo \
	--admin_user=supervisor \
	--admin_password=123 \
	--admin_email=teste@teste.com \
	--skip-email

tail -F whatever
