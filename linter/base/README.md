# Docker image with linters

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

In this Docker image, you will find some linters for your projects.

```shell
docker pull alvarofpp/linter:base
```

Linters in this image and which command to invoke it:

| Linter                          | Command                      | Config file       |
|---------------------------------|------------------------------|-------------------|
| [Commit (git)][linter-commit]   | `lint-commit <target_branch>` | `.commitlintrc`   |
| [Dockerfile][linter-dockerfile] | `lint-dockerfile`            | `.hadolint.yaml`  |
| [Markdown][linter-markdown]     | `lint-markdown`              | `.markdownlintrc` |
| [Shell script][linter-shell]    | `lint-shell`           | `.shellcheckrc`   |
| [YAML][linter-yaml]             | `lint-yaml`                  | `.yamllint`       |

You can create a `.lint/` directory with your linters configs,
exceptionally the `.shellcheckrc` file must be in the main directory.

## How to use

```shell
docker run --rm -v $(pwd):/app alvarofpp/base:linter " \
  lint-commit origin/main \
  && lint-markdown \
  && lint-shell \
  && lint-yaml"
```

## Manual test

Build the image:

```shell
docker build -t alvarofpp/linter:base linter/base
```

Run the command below to start using an image container for testing:

```shell
docker run -it --rm -v $(pwd):/app alvarofpp/linter:base /bin/bash
```

[docker-hub]: https://hub.docker.com/r/alvarofpp/linter
[linter-commit]: https://github.com/conventional-changelog/commitlint
[linter-dockerfile]: https://github.com/hadolint/hadolint
[linter-markdown]: https://github.com/igorshubovych/markdownlint-cli
[linter-shell]: https://github.com/koalaman/shellcheck
[linter-yaml]: https://github.com/adrienverge/yamllint
