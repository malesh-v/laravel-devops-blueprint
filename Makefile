up:
	docker-compose up -d --build

down:
	docker-compose down

build:
	docker-compose build

restart:
	docker-compose down && docker-compose up -d --build

exec:
	docker-compose exec app sh

artisan:
	docker-compose exec app php artisan $(cmd)

migrate:
	docker-compose exec app php artisan migrate

logs:
	docker-compose logs -f app

test:
	docker-compose exec app php artisan test
