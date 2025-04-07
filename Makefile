all: setup
	docker compose -f ./srcs/docker-compose.yml  up -d

setup:
	sudo rm -rf /home/iury/data
	mkdir -p /home/iury/data/wp-database
	mkdir -p /home/iury/data/wp-files

run:
	docker run --name basic_alpine -it alpine:3.21

delete:
	docker stop basic_alpine
	docker rm basic_alpine

build-mariadb:
	mkdir -p /home/iury/data/wp-database
	docker compose -f ./srcs/docker-compose.yml build mariadb

mariadb:
	mkdir -p /home/iury/data/wp-database
	docker compose -f ./srcs/docker-compose.yml up -d mariadb


build-wordpress:
	docker compose -f ./srcs/docker-compose.yml build wordpress

wordpress:
	docker compose -f ./srcs/docker-compose.yml up -d wordpress

clean:
	docker compose -f ./srcs/docker-compose.yml down --volumes --remove-orphans
