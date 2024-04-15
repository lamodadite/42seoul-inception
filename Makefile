all :
	mkdir -p ~/42cursus/in-test/dbv
	mkdir -p ~/42cursus/in-test/wpv
	docker compose -f srcs/docker-compose.yml up -d
	#docker compose -f srcs/docker-compose.yml up 

clean :
	docker compose -f srcs/docker-compose.yml down

fclean :
	docker compose -f srcs/docker-compose.yml down --volumes --rmi all
	rm -rf ~/42cursus/in-test