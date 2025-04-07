FROM alpine:3.21

COPY tools/setup_wordpress.sh /tmp

WORKDIR /var/www

RUN apk update && \ 
	apk add php83 --no-cache && \
	apk add	php83-curl \
			php83-dom \
			php83-exif \
			php83-fileinfo \
			php83-pecl-igbinary \
			php83-pecl-imagick \
			php83-intl \
			php83-mbstring \
			php83-mysqli \
			php83-openssl \
			php83-xml \
			php83-zip --no-cache && \
	apk add php83-pecl-apcu \
			php83-pecl-memcached \
			php83-opcache \
			php83-pecl-redis \
			php83-pecl-timezonedb --no-cache &&\
	apk add php83-fpm openrc &&\
	apk add curl --no-cache && \
	apk add php83-phar --no-cache && \
	curl -LO https://wordpress.org/latest.tar.gz &&\
	tar xvf latest.tar.gz && \
	rm -rf latest.tar.gz && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	chmod a+x /tmp/setup_wordpress.sh

RUN echo "listen = 0.0.0.0:9000" >> /etc/php83/php-fpm.d/www.conf

ENTRYPOINT ["/tmp/setup_wordpress.sh"]
