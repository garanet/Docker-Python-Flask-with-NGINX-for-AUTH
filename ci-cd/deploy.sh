#!/bin/sh
# A Docker Python-Flask with NGINX for the AUTH project
# @maintainer G.Gatto 2021 - www.garanet.net
# repo from: https://github.com/garanet/Docker-Python-Flask-with-NGINX-for-AUTH
# Tested on a MacOsx with Docker + Kuberneters (Docker-Desktop)
ssh -o StrictHostKeyChecking=no root@$DO_IP_ADDRESS << 'ENDSSH'
    cd /app
    export $(cat .env | xargs)
    docker login -u $CI_REGISTRY_USER -p $CI_JOB_TOKEN $CI_REGISTRY
    docker pull $IMAGE:garanet
    docker pull $IMAGE:nginx
    docker-compose -f docker-compose-prod.yml up -d --build
ENDSSH