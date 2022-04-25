# Linter for docker images

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

A docker image to ensure the code quality of your docker image.

```shell
docker pull alvarofpp/docker-image-linter
```

Linters in this image and which command to invoke it:

| Linter                          | Command                       | Config file         |
|---------------------------------|-------------------------------|---------------------|
| [Commit (git)][linter-commit]   | `lint-commit <target_branch>` | `.commitlintrc`     |
| [Dockerfile][linter-dockerfile] | `lint-dockerfile`             | `.dockerfilelintrc` |
| [Markdown][linter-markdown]     | `lint-markdown`               | `.markdownlintrc`   |
| [Shell script][linter-shell]    | `lint-shell-script`           | `.shellcheckrc`     |
| [YAML][linter-yaml]             | `lint-yaml`                   | `.yamllint`         |

You can create a `.lint/` directory with your linters configs,
exceptionally the `.shellcheckrc` file must be in the main directory.

## How to use

```shell
docker run --rm -v $(pwd):/app alvarofpp/docker-image-linter " \
  lint-commit origin/main \
  && lint-markdown \
  && lint-dockerfile \
  && lint-shell-script \
  && lint-yaml"
```

[docker-hub]: https://hub.docker.com/repository/docker/alvarofpp/docker-image-linter
[linter-commit]: https://github.com/conventional-changelog/commitlint
[linter-dockerfile]: https://github.com/replicatedhq/dockerfilelint
[linter-markdown]: https://github.com/igorshubovych/markdownlint-cli
[linter-shell]: https://github.com/koalaman/shellcheck
[linter-yaml]: https://github.com/adrienverge/yamllint
