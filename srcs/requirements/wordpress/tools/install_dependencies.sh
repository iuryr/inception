#!/bin/ash

mkdir -p /var/www

apk update

###dependencies
#required
apk add php83 --no-cache

#recommended
apk add	php83-curl \
		php83-dom \
		php83-exif \
		php83-fileinfo \
		php83-pecl-igbinary \
		php83-pecl-imagick \
		php83-intl \
		php83-mbstring \
		php83-openssl \
		php83-xml \
		php83-zip --no-cache

#extras
apk add php83-pecl-apcu \
		php83-pecl-memcached \
		php83-opcache \
		php83-pecl-redis \
		php83-pecl-timezonedb --no-cache

### wordpress
#curl so that we can download
apk add --no-cache curl

cd /var/www
curl -LO https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
