FROM node:12-buster

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y --no-install-recommends \
    locales \
    chromium \
    chromium-driver \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libgconf-2-4 \
    openjdk-11-jre-headless \
    && sed -i -e 's/# pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=pt_BR.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

# USER node

ENV LANG pt_BR.UTF-8
ENV CHROME_BIN /usr/bin/chromium
