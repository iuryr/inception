all: setup up

setup:
	sudo chmod a+x /etc/hosts
	sudo cat /etc/hosts | grep "iusantos.42.fr" || echo "127.0.0.1 iusantos.42.fr" >> /etc/hosts
	sudo mkdir -p /home/iury/data/wp-database
	sudo mkdir -p /home/iury/data/wp-files

up:
	sudo docker compose -f ./srcs/docker-compose.yml  up -d

down:
	sudo docker compose -f ./srcs/docker-compose.yml down

build-mariadb:
	sudo mkdir -p /home/iury/data/wp-database
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate mariadb

mariadb:
	sudo mkdir -p /home/iury/data/wp-database
	sudo docker compose -f ./srcs/docker-compose.yml up -d mariadb

build-wordpress:
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate wordpress

wordpress:
	sudo docker compose -f ./srcs/docker-compose.yml up -d wordpress

build-nginx:
	sudo docker compose -f ./srcs/docker-compose.yml up -d --build --force-recreate nginx

nginx:
	sudo docker compose -f ./srcs/docker-compose.yml up -d nginx

clean:
	sudo rm -rf /home/iury/data/wp-database /home/iury/data/wp-files
	sudo docker compose -f ./srcs/docker-compose.yml down --volumes --remove-orphans

fclean: clean
	sudo docker system prune --volumes --all --force

re: clean all
