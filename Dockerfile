FROM ubuntu:latest

LABEL version="1.0.4" \
    description="A Docker instance running the latest Chrome and @angular/cli" \
    maintainer="wraptor@wheezie.be"

RUN apt-get update -y && apt-get install -y nodejs npm wget libxss1 libindicator7 fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libgtk-3-0 libnspr4 libnss3 libx11-xcb1 libxtst6 lsb-release xdg-utils

RUN npm install npm@latest -get

# Chrome repository

RUN cd /tmp/
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i ./google-chrome*.deb
RUN apt-get install -f
