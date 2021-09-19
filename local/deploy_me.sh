#!/bin/bash
# A Docker Python-Flask with NGINX for the AUTH project
# @maintainer G.Gatto 2021 - www.garanet.net
# repo from: https://github.com/garanet/Docker-Python-Flask-with-NGINX-for-AUTH
# Tested on a MacOsx with Docker + Kuberneters (Docker-Desktop)
if [ "$1" == "start" ]; then
    clear   
    echo "Init Docker composer"
    if docker-compose up -d ; then 
        echo 'Check internal world Flask-endpoint'
        curl -I http://localhost:5000/world
        echo ''
        echo 'Check internal garanet Flask-endpoint'
        curl -I http://localhost:5000/garanet
        echo ''
        echo 'Check internal getmyfile POST Flask-endpoint'
        curl --header "Content-Type: application/json" --request POST --data '{"key":"POST JSON WORKS"}' http://localhost:5000/getmyfile
        echo ''
        echo 'Check NGINX Proxy'
        curl -I http://localhost:8080
        echo ''
        echo 'Open your browser and visit the urls: '
        echo 'or http://localhost:8080/garanet - http://localhost:8080/world'
        echo ''
    else
        clear
        echo "!!!"
        echo 'Exception to build it, please check your Dockerfile!!!'
        echo "!!!"
    fi
else
if [ "$1" == "stop" ]; then
    clear
    docker-compose down
else
    if [ "$1" == "remove" ]; then
    clear
    docker-compose rm -f -s -a
else
    clear
    echo "!!!"
    echo 'Please use the script with arguments start / stop / remove:'
    echo 'Start => #: ./deploy_me.sh start'
    echo 'or'
    echo 'Stop  => #: ./deploy_me.sh stop' 
    echo 'or'
    echo 'Remove=> #: ./deploy_me.sh remove' 
    exit 0
fi
fi
fi