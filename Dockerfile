FROM ubuntu:18.04

MAINTAINER "KarthickMP" <karthicksiva36@yahoo.com>

LABEL name="Robot Framework"

RUN apt-get update \
	&& apt-get install -y build-essential libssl-dev libffi-dev python-dev git \
		python-pip python-dev gcc phantomjs firefox \
		xvfb zip wget ca-certificates ntpdate \
		libnss3-dev libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation \
	&& rm -rf /var/lib/apt/lists/*

ADD . /
RUN pip install -r requirements.txt

RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz \
	&& tar xvzf geckodriver-*.tar.gz \
	&& rm geckodriver-*.tar.gz \
	&& mv geckodriver /usr/local/bin \
	&& chmod a+x /usr/local/bin/geckodriver

ENTRYPOINT ["/bin/sh", "run_tests.sh"]