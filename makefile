dev-up-build:
	docker compose up --build

dev-up:
	docker compose up

test-all:
	docker compose -f docker-compose.yml -f docker-compose.test.yml run --rm web

db-reset:
	docker compose run --rm web rake db:drop db:create db:migrate

console:
	docker compose run --rm web rails console

bash:
	docker compose run --rm web bash
