FROM alpine:3.21

ARG WP_DATABASE_NAME

RUN apk update &&\
	apk add --no-cache mariadb mariadb-client &&\
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY ./tools/setup_database.sh /

RUN ash -f setup_database.sh

ENTRYPOINT ["mariadbd-safe"]
