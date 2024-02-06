FROM alpine:3.19.1

# Set environment variables
ENV HOME=/root
ENV WORKDIR=/app

# Install packages
RUN apk --no-cache add \
    findutils \
    bash-completion

# Set user
ARG USER=appuser
ARG UID=1000

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --no-create-home \
    --uid "${UID}" \
    "${USER}"

USER $UID

# Workdir and entrypoint
WORKDIR ${WORKDIR}

ENTRYPOINT []
