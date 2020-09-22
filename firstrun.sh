#!/bin/bash

PKG="onedrive"
REPO=""
OWNER="jscoobyced/"
ODDIR=/home/${USER}/OneDrive
ODCONF=/home/${USER}/.onedrive
mkdir -p ${ODDIR}
mkdir -p ${ODCONF}

#docker run -i --user "$(id -u):$(id -g)" \
#    --mount source=${ODDIR},target=/onedrive/Data,type=bind \
#    --mount source=${ODCONF},target=/onedrive/config,type=bind \
#    --name onedrive ${REPO}${OWNER}${PKG}:latest \
#    "--synchronize"
#docker rm onedrive

docker run -d --user "$(id -u):$(id -g)" \
    --mount source=${ODDIR},target=/onedrive/Data,type=bind \
    --mount source=${ODCONF},target=/onedrive/config,type=bind \
    --restart unless-stopped \
    --log-driver json-file --log-opt max-size=1m --log-opt max-file=3 \
    --name onedrive ${REPO}${OWNER}${PKG}:latest
