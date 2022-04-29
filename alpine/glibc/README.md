# Alpine GNU C library (glibc) Docker image

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

This image is based on Alpine Linux image and contains [glibc][glibc] (v. 2.34-r0) to enable
proprietary projects compiled against glibc work on Alpine.

```shell
docker pull alvarofpp/alpine:glibc
```

## How to use

```Dockerfile
FROM alvarofpp/alpine:glibc

# ...
```

[docker-hub]: https://hub.docker.com/r/alvarofpp/alpine
[glibc]: https://github.com/sgerrand/alpine-pkg-glibc
