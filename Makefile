docker-build:
	DOCKER_BUILDKIT=1 docker build --platform linux/amd64 --ssh default -t lujeni/breuvage:latest .

compose: docker-build
	docker compose up --build --force-recreate
