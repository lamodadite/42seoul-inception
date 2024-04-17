all :
	mkdir -p /home/jongmlee/data/dbv
	mkdir -p /home/jongmlee/data/wpv
	docker compose -f srcs/docker-compose.yml up -d

clean :
	docker compose -f srcs/docker-compose.yml down

fclean :
	docker compose -f srcs/docker-compose.yml down --volumes --rmi all
	rm -rf /home/jongmlee/data