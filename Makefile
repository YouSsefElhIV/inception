all: build up


build:

	mkdir -p /home/yel-haya/data/wordpress
	mkdir -p /home/yel-haya/data/database
	docker compose -f ./srcs/docker-compose.yml build

up:
	docker compose -f ./srcs/docker-compose.yml up

down:
	docker compose -f ./srcs/docker-compose.yml down
	docker rmi wordpress:inception nginx:inception mariadb:inception adminer:inception cadvisor:inception static_web:inception redis:inception ftp:inception
	rm -rf /home/yel-haya/data

start:
	docker compose -f ./srcs/docker-compose.yml start

stop:
	docker compose -f ./srcs/docker-compose.yml stop

re: down all
