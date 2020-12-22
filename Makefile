PROJECT = concourse-helm-eks-resource
ID = nefelinetworks/${PROJECT}

all: init build push

init:
	docker login

build:
	docker build --tag ${ID}:latest .

push:
	docker push ${ID}

run:
	docker run \
		--volume $(shell pwd):/opt/helm-3 \
		--workdir /opt/helm-3 \
		--interactive \
		--tty \
		${ID}:latest \
		bash
