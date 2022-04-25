FROM alvarofpp/base-linter:latest

# Install packages
RUN apk --no-cache add python3 \
  py3-pip

# Install linter for Python (https://github.com/PyCQA/flake8)
RUN pip3 install \
  flake8==4.0.1 \
  flake8-import-order==0.18.1 \
  flake8-quotes==3.3.1 \
  flake8-commas==2.1.0 \
  flake8-docstrings==1.6.0

# Install linter for Dockerfile (https://github.com/replicatedhq/dockerfilelint)
RUN npm install -g \
    dockerfilelint@1.8.0

# Adds shell commands
COPY ./commands/*.sh /usr/bin/
RUN find /usr/bin -type f -name "*.sh" | while read NAME ; do mv "${NAME}" "${NAME%.sh}" ; done

# Default lint configurations
RUN mkdir -p ${LINT_CONFIG_PATH} ${LINT_CUSTOM_CONFIG_PATH}
COPY ./.lint/* ${LINT_CONFIG_PATH}/
