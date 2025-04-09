all: setup up

setup:
	grep "iusantos.42.fr" /etc/hosts || echo "127.0.0.1 iusantos.42.fr" | sudo tee --append /etc/hosts > /dev/null
	sudo mkdir -p /home/iury/data/wp-database
	sudo mkdir -p /home/iury/data/wp-files

up:
	docker compose -f ./srcs/docker-compose.yml  up -d

down:
	docker compose -f ./srcs/docker-compose.yml down

build-mariadb:
	sudo mkdir -p /home/iury/data/wp-database
	docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate mariadb

mariadb:
	sudo mkdir -p /home/iury/data/wp-database
	docker compose -f ./srcs/docker-compose.yml up -d mariadb

build-wordpress:
	docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate wordpress

wordpress:
	docker compose -f ./srcs/docker-compose.yml up -d wordpress

build-nginx:
	docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate nginx

nginx:
	docker compose -f ./srcs/docker-compose.yml up -d nginx

build-ftp:
	docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate ftp

ftp: setup
	docker compose -f ./srcs/docker-compose.yml up -d ftp

clean:
	sudo rm -rf /home/iury/data/wp-database /home/iury/data/wp-files
	docker compose -f ./srcs/docker-compose.yml down --volumes --remove-orphans

fclean: clean
	docker system prune --volumes --all --force

basic:
	docker run --name alpine_basic -p 9000:9000 -it alpine:3.21 ash

delete:
	docker rm alpine_basic

re: clean all
