docker-build:
	DOCKER_BUILDKIT=1 docker build --platform linux/amd64 --ssh default -t lujeni/breuvage:exercism .

track: docker-build
	docker run -it --rm -e TOKEN=${TOKEN} -v ${PWD}/workspaces:/usr/src/app/workspaces lujeni/breuvage:exercism

