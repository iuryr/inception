FROM alpine:3.21

ARG WP_DATABASE_NAME
ARG WP_DATABASE_USER

RUN apk update &&\
	apk add --no-cache mariadb mariadb-client &&\
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql

COPY ./tools/setup_database.sh /
COPY ./conf/my.cnf /etc

RUN --mount=type=secret,id=wp_database_password,env=WP_DATABASE_PASSWORD ash -f setup_database.sh

ENTRYPOINT ["mariadbd-safe"]
