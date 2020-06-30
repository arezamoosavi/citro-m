init:
	sudo sysctl -w vm.max_map_count=262144
	sudo rm -rf esdata/
	mkdir esdata
	sudo chmod 777 -R esdata/

build_start:
	docker-compose up --build -d

get-indexes:
	curl http://localhost:9200/_cat/indices

do-scp:
	scp -r . root@172.16.1.132:/opt/elk/dep_elk