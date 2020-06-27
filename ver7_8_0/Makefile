init:
	sudo sysctl -w vm.max_map_count=262144
	sudo rm -rf esdata/
	sudo rm -rf apache-logs/
	mkdir esdata
	mkdir apache-logs
	sudo chmod 777 -R esdata/
	sudo chmod 777 -R apache-logs/

build_start:
	docker-compose up --build -d

create-log:
	curl http://localhost:8888/

topic-log:
	docker-compose exec kafka kafka-topics --create \
	--topic log --if-not-exists \
	kafka:9092 --replication-factor 1 --partitions 1 \
	--zookeeper zookeeper:2181 sleep infinity

get-indexes:
	curl http://localhost:9200/_cat/indices

remove-containers:
	docker container prune -f
