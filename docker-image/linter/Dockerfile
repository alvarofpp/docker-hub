FROM alpine:3.15

# Set environment variables
ENV HOME=/root
ENV LINT_CONFIG_PATH="${HOME}/.lint"
ENV WORKDIR=/app
ENV LINT_CUSTOM_CONFIG_PATH="${WORKDIR}/.lint"

# Install packages
RUN apk --no-cache add findutils  \
    file \
    curl \
    bash-completion \
    git \
    nodejs \
    npm

# Install linter for commits (https://github.com/conventional-changelog/commitlint)
RUN npm install -g \
    @commitlint/config-conventional@15.0.0 \
    @commitlint/cli@15.0.0

# Install linter for Markdown (https://github.com/igorshubovych/markdownlint-cli)
RUN npm install -g \
    markdownlint-cli@0.30.0

# Install linter for Shell scripts (https://github.com/koalaman/shellcheck)
RUN apk --no-cache add shellcheck

# Install linter for Yaml (https://github.com/adrienverge/yamllint)
RUN apk --no-cache add yamllint

# Adds shell commands
COPY ./commands/*.sh /usr/bin/
RUN find /usr/bin -type f -name "*.sh" | while read NAME ; do mv "${NAME}" "${NAME%.sh}" ; done

# Default lint configurations
RUN mkdir -p ${LINT_CONFIG_PATH} ${LINT_CUSTOM_CONFIG_PATH}
COPY ./.lint/* ${LINT_CONFIG_PATH}/

# Workdir and entrypoint
WORKDIR ${WORKDIR}

ENTRYPOINT ["docker-entrypoint"]
