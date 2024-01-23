FROM alvarofpp/linter:base

# Install packages
RUN apk --no-cache add python3 \
  py3-pip

# Virtual environment
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install linter for Python (https://github.com/PyCQA/flake8)
RUN pip3 install --no-cache-dir \
  ruff==0.1.14

# Adds shell commands
COPY ./commands/* /usr/bin/

# Default lint configurations
# hadolint ignore=SC2086
RUN mkdir -p ${LINT_CONFIG_PATH} ${LINT_CUSTOM_CONFIG_PATH}
COPY ./.lint/* ${LINT_CONFIG_PATH}/
