FROM alpine:3.21

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN apk update &&\
	apk add nginx openssl --no-cache &&\
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/private.key\
	-out /etc/nginx/selfsigned.crt -subj "/C=BR/ST=SP/L=São Paulo/O=42SP/CN=iusantos.42.fr"

ENTRYPOINT ["nginx", "-g", "daemon off;"]
