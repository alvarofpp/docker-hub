# Variables
ROOT=$(shell pwd)
DOCKER_IMAGE_LINTER=alvarofpp/linter:base
LINT_COMMIT_TARGET=origin/main

# Commands
.PHONY: install-hooks
install-hooks:
	git config core.hooksPath .githooks

.PHONY: lint
lint:
	@docker pull ${DOCKER_IMAGE_LINTER}
	@docker run --rm -v ${ROOT}:/app ${DOCKER_IMAGE_LINTER} " \
		lint-commit ${LINT_COMMIT_TARGET} \
		&& lint-markdown \
		&& lint-dockerfile \
		&& lint-yaml \
		&& lint-shell-script"
