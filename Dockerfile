FROM node:11-slim

LABEL version="1.1.2" \
    description="A Docker instance running the latest (stable) Chrome and @angular/cli running on the latest node image." \
    maintainer="wraptor@wheezie.be"

RUN apt-get update -y && apt-get install -y wget libxss1 libindicator7 fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libgtk-3-0 libnspr4 libnss3 libx11-xcb1 libxtst6 lsb-release xdg-utils

# Chrome repository
RUN cd /tmp/
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i ./google-chrome*.deb
RUN rm ./google-chrome*.deb
RUN apt-get install -f
