FROM alvarofpp/base:linter

# Install packages
RUN apk --no-cache add python3 \
  py3-pip

# Install linter for Python (https://github.com/PyCQA/flake8)
RUN pip3 install \
  flake8==6.0.0 \
  flake8-import-order==0.18.2 \
  flake8-quotes==3.3.2 \
  flake8-commas==2.1.0 \
  flake8-docstrings==1.7.0

# Adds shell commands
COPY ./commands/*.sh /usr/bin/
RUN find /usr/bin -type f -name "*.sh" | while read NAME ; do mv "${NAME}" "${NAME%.sh}" ; done

# Default lint configurations
RUN mkdir -p ${LINT_CONFIG_PATH} ${LINT_CUSTOM_CONFIG_PATH}
COPY ./.lint/* ${LINT_CONFIG_PATH}/
