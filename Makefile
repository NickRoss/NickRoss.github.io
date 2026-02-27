.PHONY: build serve inter trace clean

IMAGE_NAME = hugo-site
CONTAINER_NAME = hugo-server
PORT_MAPPING = 4000:4000

build:
	docker build -t $(IMAGE_NAME) .

serve: build
	docker run --rm -it \
		-p $(PORT_MAPPING) \
		-v $${PWD}:/site \
		--name $(CONTAINER_NAME) \
		$(IMAGE_NAME)

inter: build
	docker run --rm -it \
		-v $${PWD}:/site \
		--entrypoint /bin/sh \
		$(IMAGE_NAME)

trace: build
	docker run --rm -it \
		-p $(PORT_MAPPING) \
		-v $${PWD}:/site \
		--name $(CONTAINER_NAME) \
		$(IMAGE_NAME) server --bind 0.0.0.0 --port 4000 --buildDrafts --debug --verbose

clean:
	-docker stop $(CONTAINER_NAME) 2>/dev/null || true
	-docker rm $(CONTAINER_NAME) 2>/dev/null || true
	-docker rmi $(IMAGE_NAME) 2>/dev/null || true
	rm -rf public resources .hugo_build.lock
