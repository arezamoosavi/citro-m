init:
	sudo sysctl -w vm.max_map_count=262144
	sudo rm -rf esdata/
	sudo rm -rf apache-logs/
	mkdir esdata
	mkdir apache-logs

build:
	docker-compose build
	docker-compose rm -f

start:
	docker-compose up --remove-orphans

build_start:
	docker-compose up --build

create-log:
	curl http://localhost:8888/

topic-log:
	docker-compose exec kafka kafka-topics --create \
	--topic log --if-not-exists \
	kafka:9092 --replication-factor 1 --partitions 1 \
	--zookeeper zookeeper:2181 sleep infinity

get-indexes:
	curl http://localhost:9200/_cat/indices

cleanup:
	docker-compose down -v

remove-containers:
	docker container prune -f
	# docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
