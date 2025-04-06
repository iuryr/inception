FROM alpine:3.21

ARG WP_DATABASE_NAME
ARG WP_DATABASE_USER

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
			php83-pecl-timezonedb --no-cache && \
	apk add curl --no-cache && \
	apk add php83-phar --no-cache && \
	curl -LO https://wordpress.org/latest.tar.gz &&\
	tar xvf latest.tar.gz && \
	rm -rf latest.tar.gz

ENTRYPOINT ["ash", "-f", "/tmp/setup_wordpress.sh"]
