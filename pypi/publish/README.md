# Docker image to publish the package on PyPi

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

A Docker image to publish your package on [Python Package Index (PyPi)][pypi].

```shell
docker pull alvarofpp/pypi-publish
```

## How to use

```shell
docker run --rm \
  -e USER=__token__ \
  -e PASSWORD=YOUR_TOKEN \
  -v $(pwd):/app alvarofpp/pypi-publish
```

You need to pass `USER` and `PASSWORD` to work.

### GitHub Actions

```yml
---
name: Publish the package on PyPi

on:
  release:
    types: [published]

jobs:
  publish-package:
    name: Publish the package
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Generate REPOSITORY_NAME env variable
        run: echo "REPOSITORY_NAME=$(echo '${{ github.repository }}' | awk -F '/' '{print $2}')" >> $GITHUB_ENV
        shell: bash
      - name: Docker pull
        run: docker pull alvarofpp/pypi-publish
      - name: Publish ${{ env.REPOSITORY_NAME }} (${{ github.ref_name }}) to PyPi
        run: |
          docker run --rm \
          -e USER=__token__ \
          -e PASSWORD=${{ secrets.PYPI_API_TOKEN }} \
          -v $(pwd):/app \
          alvarofpp/pypi-publish
```

[docker-hub]: https://hub.docker.com/r/alvarofpp/pypi-publish
[pypi]: https://pypi.org/
