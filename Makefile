
OPENSEARCH_ADMIN_PASSWORD = xxxxx
.DEFAULT_GOAL := up


.PHONY: up down clean logs config
.PHONY: test

up:
	docker run -d -p 9200:9200 -p 9600:9600 -e "discovery.type=single-node" -e "OPENSEARCH_ADMIN_PASSWORD=${OPENSEARCH_ADMIN_PASSWORD}" opensearchproject/opensearch:latest
test:
curl https://localhost:9200 -ku 'admin:${OPENSEARCH_ADMIN_PASSWORD}'
down:
	docker compose down

clean:
	docker compose down -v

logs:
	docker compose logs -f -t

config:
	docker compose config

 