#!/bin/sh

mkdir -p /var/www
cd /var/www

apk add --no-cache curl

curl -LO https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
