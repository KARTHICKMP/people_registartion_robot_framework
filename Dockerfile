FROM ubuntu:18.04

MAINTAINER "KarthickMP" <karthicksiva36@yahoo.com>

LABEL name="Docker build for People App test"

RUN apt-get update \
	&& apt-get install -y build-essential libssl-dev libffi-dev python-dev \
		python-pip python-dev gcc phantomjs firefox \
		xvfb zip wget ca-certificates ntpdate \
		libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation \
	&& rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install -r requirements.txt

RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz \
	&& tar xvzf geckodriver-*.tar.gz \
	&& rm geckodriver-*.tar.gz \
	&& mv geckodriver /usr/local/bin \
	&& chmod a+x /usr/local/bin/geckodriver
# install chrome and chromedriver in one run command to clear build caches for new versions (both version need to match)
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install libcurl3 \
    && apt --fix-broken install \
	&& dpkg -i google-chrome*.deb \
	&& rm google-chrome*.deb \
    && wget -q https://chromedriver.storage.googleapis.com/92.0.4515.43/chromedriver_linux64.zip \
	&& unzip chromedriver_linux64.zip \
	&& rm chromedriver_linux64.zip \
	&& mv chromedriver /usr/local/bin \
	&& chmod +x /usr/local/bin/chromedriver