#!/bin/sh

envsubst '${CRT_FILE} ${CRT_KEY} ${DOMAIN_NAME}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

nginx -g "daemon off;"
