FROM alpine:3.21

ARG CRT_KEY
ARG CRT_FILE

COPY ./conf/nginx.conf.template /etc/nginx/nginx.conf.template
COPY ./tools/init_nginx.sh /tmp/init_nginx.sh
RUN chmod a+x /tmp/init_nginx.sh

RUN apk update &&\
	apk add nginx openssl envsubst --no-cache &&\
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $CRT_KEY -out  $CRT_FILE -subj "/C=BR/ST=SP/L=São Paulo/O=42SP/CN=iusantos.42.fr"

ENTRYPOINT ["./tmp/init_nginx.sh"]
