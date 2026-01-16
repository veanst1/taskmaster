.PHONY: build up down restart logs clean backup

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

restart:
	docker-compose restart

logs:
	docker-compose logs -f

clean:
	docker-compose down -v
	docker system prune -f

backup:
	docker exec taskmaster-backup sh -c "tar -czf /backups/manual-backup-$$(date +%Y%m%d-%H%M%S).tar.gz /data"

ps:
	docker-compose ps

stats:
	docker stats taskmaster