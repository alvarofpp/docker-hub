# Docker image with linters

[![Docker Hub](https://img.shields.io/badge/-Docker_Hub-0062cc?style=for-the-badge&logo=Docker&logoColor=white)][docker-hub]

In this Docker image, you will find some linters for your projects.

```shell
docker pull alvarofpp/base:linter
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
docker run --rm -v $(pwd):/app alvarofpp/base:linter " \
  lint-commit origin/main \
  && lint-markdown \
  && lint-shell-script \
  && lint-yaml"
```

[docker-hub]: https://hub.docker.com/r/alvarofpp/base
[linter-commit]: https://github.com/conventional-changelog/commitlint
[linter-dockerfile]: https://github.com/replicatedhq/dockerfilelint
[linter-markdown]: https://github.com/igorshubovych/markdownlint-cli
[linter-shell]: https://github.com/koalaman/shellcheck
[linter-yaml]: https://github.com/adrienverge/yamllint
