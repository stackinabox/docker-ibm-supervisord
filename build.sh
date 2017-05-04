#!/usr/bin/env sh

#source ./build.rc

ARTIFACT_VERSION=${ARTIFACT_VERSION:-latest}

docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
docker build -t stackinabox/ibm-supervisord:$ARTIFACT_VERSION --build-arg ARTIFACT_VERSION=$ARTIFACT_VERSION .
docker push stackinabox/ibm-supervisord:$ARTIFACT_VERSION
