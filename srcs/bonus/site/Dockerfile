FROM alpine:3.21

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY site /var/www/site

RUN apk update &&\
	apk add --no-cache nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]
