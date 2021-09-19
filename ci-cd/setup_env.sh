# A Docker Python-Flask with NGINX for the AUTH project
# @maintainer G.Gatto 2021 - www.garanet.net
# repo from: https://github.com/garanet/Docker-Python-Flask-with-NGINX-for-AUTH
# Tested on a MacOsx with Docker + Kuberneters (Docker-Desktop)
# GITLAB ENV
echo CI_JOB_TOKEN=$CI_JOB_TOKEN  >> .env
echo CI_REGISTRY=$CI_REGISTRY  >> .env
# APP ENV
echo SECRET_KEY=$SECRET_KEY >> .env
echo REACT_APP_SERVICE_URL=$REACT_APP_SERVICE_URL >> .env
# IMAGE ENV
echo PLOTWISE_IMAGE=$IMAGE:garanet  >> .env
echo NGINX_IMAGE=$IMAGE:nginx >> .env