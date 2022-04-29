FROM alpine:3.15

# Set environment variables
ENV GLIBC_VER=2.34-r0
ENV LANG=C.UTF-8

# Install GLIBC
RUN apk add --no-cache --virtual=.build-dependencies curl ca-certificates
COPY ./certs/sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub
RUN curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
    && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-i18n-${GLIBC_VER}.apk

RUN apk add --no-cache \
    glibc-${GLIBC_VER}.apk \
    glibc-bin-${GLIBC_VER}.apk \
    glibc-i18n-${GLIBC_VER}.apk \
    && (/usr/glibc-compat/bin/localedef --force --inputfile POSIX --charmap UTF-8 "$LANG" || true) \
    && echo "export LANG=$LANG" > /etc/profile.d/locale.sh

RUN apk del glibc-i18n \
    && rm -rf glibc-*.apk \
    && rm /etc/apk/keys/sgerrand.rsa.pub \
    && apk del .build-dependencies
