# Definition of environment variables

DOMAIN_NAME=XXX  

## Database
WP_DATABASE_NAME=XXXX  
WP_DATABASE_USER=XXXX  
WP_DATABASE_PASSWORD=XXXX  
WP_DATABASE_HOST=XXXX  

## Wordpress
WP_URL=XXXX  
WP_TITLE=XXXX  
WP_ADMIN_USER=XXXX  
WP_ADMIN_PASSWORD=XXXX  
WP_ADMIN_EMAIL=XXXX@fake.com  

## TLS params
CERT_KEY=XXX  
CERT_FILE=XXX  

---
example

WP_DATABASE_NAME=wpdb
WP_DATABASE_USER=wpusr
WP_DATABASE_PASSWORD=12345
WP_DATABASE_HOST=mariadb

WP_URL=iusantos.42.fr
WP_TITLE=Inception Page
WP_ADMIN_USER=supervisor
WP_ADMIN_PASSWORD=54321
WP_ADMIN_EMAIL=supervisor@fake.com

CRT_KEY=/etc/nginx/private.key
CRT_FILE=/etc/nginx/selfsigned.crt

DOMAIN_NAME=iusantos.42.fr
