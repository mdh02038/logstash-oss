.PHONY: default build auto-build-and-push


PLATFORMS ?= linux/amd64,linux/arm64
DOCKER_IMAGE ?= raquette/logstash-oss
VERSION ?= "edge"
LOGSTASH_VERSION ?= "1:7.9.3-1"

MANIFEST_TAG = $(DOCKER_IMAGE):$(VERSION)

default: build

auto-build-and-push:
	docker buildx build  --push --platform $(PLATFORMS) -t "$(MANIFEST_TAG)"  --build-arg LOGSTASH_VERSION=${LOGSTASH_VERSION} -f Dockerfile . 

build:
	docker buildx build --platform $(PLATFORMS) -t "$(MANIFEST_TAG)"  --build-arg LOGSTASH_VERSION=${LOGSTASH_VERSION} -f Dockerfile . 
