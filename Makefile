airflow-init:
	docker compose up airflow-init

build:
	docker compose build

build-service:
	docker compose build ${SERVICE}

build-no-cache:
	docker compose build --no-cache

build-service-no-cache:
	docker compose build --no-cache ${SERVICE}

pull:
	docker compose pull

up:
	docker compose up -d

up-moded:
	docker compose -f docker-compose-mod.yml up -d

down-moded:
	docker compose -f docker-compose-mod.yml down

up-service:
	docker compose up -d ${SERVICE} 

down:
	docker compose down 

down-service:
	docker compose down ${SERVICE}

# make logs SERVICE=service-name
logs-list:
	docker compose logs -f --tail 40 ${SERVICE}

# make network-create NETWORK=external-network-name
network-create:
	docker network create ${NETWORK}

# make network-remove NETWORK=external-network-name
network-remove:
	docker network rm ${NETWORK}

# make console SERVICE=service-name
console:
	docker compose exec ${SERVICE} bash