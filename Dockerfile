FROM node:11-alpine

LABEL version="1.1.2" \
    description="A Docker image running the latest (stable) Chrome and @angular/cli running on the node Alpine image v11." \
    maintainer="wraptor@wheezie.be"

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Installs latest Chromium package.
RUN echo @edge http://dl-3.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
    && echo @edge http://dl-3.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk add --no-cache \
    chromium@edge \
    && rm -rf /var/cache/*

RUN mkdir -p /usr/src/app \
    && adduser -D chrome \
    && chown -R chrome:chrome /usr/src/app
USER chrome
WORKDIR /usr/src/app

ENTRYPOINT ["chromium-browser", "--headless", "--disable-gpu", "--disable-software-rasterizer", "--disable-dev-shm-usage"]
