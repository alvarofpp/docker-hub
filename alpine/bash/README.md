# Docker image for run bash scripts (and more)

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

This image is based on Alpine Linux image, you can use this image to run bash scripts.

```shell
docker pull alvarofpp/alpine-bash
```

## How to use

```shell
docker run --rm -v $(pwd):/app alvarofpp/alpine-bash ./my_script.sh
```

[docker-hub]: https://hub.docker.com/r/alvarofpp/alpine-bash
