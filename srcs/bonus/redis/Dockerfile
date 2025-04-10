FROM alpine:3.21

RUN apk update && apk add --no-cache redis

COPY conf/redis.conf /etc/redis/redis.conf
RUN mkdir /data && chown redis:redis /data

ENTRYPOINT [ "redis-server", "/etc/redis/redis.conf" ]
