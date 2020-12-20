create-network:
	@docker network create opstree || true > /dev/null

build:
	docker build -t opstree/ftpclient:1.0 -f Dockerfile.ftpserver .
	docker build -t opstree/ftpserver:1.0 -f Dockerfile.ftpclient .

run:
	@docker rm -f ftpclient || true > /dev/null
	@docker rm -f ftpserver || true > /dev/null
	@docker run -itd --name ftpclient -v ${PWD}:/ftplab --net opstree opstree/ftpclient:1.0
	@docker run -itd --name ftpserver --net opstree opstree/ftpserver:1.0
	@docker exec -it ftpserver bash -c "/etc/init.d/ssh start"

run-client:
	docker run -it --rm --name ftpclient -v ${PWD}:/ftplab ot/sftpclient