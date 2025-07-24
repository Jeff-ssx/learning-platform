dev-up-build:
	docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build

dev-up:
	docker compose -f docker-compose.yml -f docker-compose.dev.yml up

test-build:
	docker compose -f docker-compose.test.yml build

test-all:
	docker compose -f docker-compose.test.yml run --rm test

db-reset-dev:
	docker compose run --rm -e PGDATABASE=postgres web rake db:drop db:create db:migrate

db-reset-test:
	docker compose -f docker-compose.yml -f docker-compose.test.yml run --rm web rake db:drop db:create db:migrate

console:
	docker compose run --rm web rails console

bash:
	docker compose run --rm web bash
