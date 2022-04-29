FROM alpine:3.15 

# Set environment variables
ENV WORKDIR=/app
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1
# Alternatively: pip3 install setuptools_rust

# Install packages
RUN apk add --update --no-cache \
    bash-completion \
    gcc \
    libc-dev \
    libffi-dev \
    python3-dev \
    py3-pip

# Install requirements
RUN pip install --upgrade pip
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Adds shell commands
COPY ./commands/*.sh /usr/bin/
RUN find /usr/bin -type f -name "*.sh" | while read NAME ; do mv "${NAME}" "${NAME%.sh}" ; done

# Entrypoint
WORKDIR ${WORKDIR}
ENTRYPOINT ["upload"]
