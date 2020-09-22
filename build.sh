#!/bin/bash

PKG="onedrive"
REPO=""
OWNER="jscoobyced/"

docker build -t ${REPO}${OWNER}${PKG}:latest .

if [ "$1" = "push" ]; then
    docker push ${REPO}${OWNER}${PKG}:latest
fi
