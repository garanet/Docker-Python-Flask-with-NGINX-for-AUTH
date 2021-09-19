# A Docker Python-Flask with NGINX for the AUTH project
# @maintainer G.Gatto 2021 - www.garanet.net
# repo from: https://github.com/garanet/Docker-Python-Flask-with-NGINX-for-AUTH
# Tested on a MacOsx with Docker + Kuberneters (Docker-Desktop)
FROM python:latest

ENV APPPATH /opt/garanet
ADD app $APPPATH
COPY app/app.py $APPPATH/app/app.py
COPY requirements.txt $APPPATH
WORKDIR $APPPATH/app

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

RUN buildDeps='python3-pip python-dev build-essential' \
    && set -x \
    && apt-get update \
	&& apt-get install -y $buildDeps \
 	&& pip install --upgrade pip \
 	&& pip install -r $APPPATH/requirements.txt \
 	&& apt-get clean \
 	&& rm -rf /var/lib/apt/lists/* \
 	&& apt-get purge -y --auto-remove $buildDeps

EXPOSE 5000

ENTRYPOINT ["python3"]
CMD ["app.py"]
