FROM alpine:3.21

ARG WP_DATABASE_NAME
ARG WP_DATABASE_USER
ARG WP_DATABASE_PASSWORD #change later

RUN apk update &&\
	apk add --no-cache mariadb mariadb-client &&\
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY ./tools/setup_database.sh /
COPY ./conf/my.cnf /etc

RUN ash -f setup_database.sh

ENTRYPOINT ["mariadbd-safe"]
