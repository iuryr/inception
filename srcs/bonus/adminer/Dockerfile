FROM alpine:3.21

WORKDIR /var/www/adminer

RUN apk update &&\
	apk add --no-cache php83 php83-fpm php83-mysqli php83-session curl &&\
	curl -LO https://github.com/vrana/adminer/releases/download/v5.1.1/adminer-5.1.1-mysql.php &&\
	mv adminer-5.1.1-mysql.php index.php &&\
	chmod a+x index.php &&\
	echo "listen = 0.0.0.0:8000" >> /etc/php83/php-fpm.d/www.conf

ENTRYPOINT ["php-fpm83", "-F"]
