
IMAGE_NAME = vertx-s2i

build:
	docker build -t $(IMAGE_NAME) .

.PHONY: test
test:
	docker build -t $(IMAGE_NAME)-candidate .
	IMAGE_NAME=$(IMAGE_NAME)-candidate BUILDER=maven test/run
	IMAGE_NAME=$(IMAGE_NAME)-candidate BUILDER=maven-multimodule STI_ENV='-e OUTPUT_DIR=app/target' test/run
	IMAGE_NAME=$(IMAGE_NAME)-candidate BUILDER=gradle test/run
