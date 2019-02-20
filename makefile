APP=cofemei/grails
VER=3.2.11

all: build push
build:
	docker build -t ${APP}:${VER} .
push:
	docker push cofemei/grails:${VER}
bash:
	docker run --name grails --rm -v /Users/mei/Dropbox/:/root/Dropbox/ -p 8080:8080 -it cofemei/grails:${VER} bash
