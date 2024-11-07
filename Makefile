all:
	@sudo mkdir -p /home/ykhayri/data/maria
	@sudo mkdir -p /home/ykhayri/data/wordp
	@docker-compose -f srcs/docker-compose.yml up -d --build

rebuild:
	@@docker-compose -f srcs/docker-compose.yml down -v
	@docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	@sudo rm -rf /home/ykhayri/data/maria/*
	@sudo rm -rf /home/ykhayri/data/wordp/*

stop: clean
	docker-compose -f srcs/docker-compose.yml down -v

fclean: stop
	@docker system prune -af

re: fclean all

.PHONY:
	all clean fclean re