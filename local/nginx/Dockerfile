# A Docker Python-Flask with NGINX for the AUTH project
# @maintainer G.Gatto 2021 - www.garanet.net
# repo from: https://github.com/garanet/Docker-Python-Flask-with-NGINX-for-AUTH
# Tested on a MacOsx with Docker + Kuberneters (Docker-Desktop)
FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY dev.conf /etc/nginx/conf.d/default.conf
COPY .htpasswd /etc/nginx/conf.d