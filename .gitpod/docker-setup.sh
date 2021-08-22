#!/usr/bin/env bash
if [ -n "$GITPOD_HEADLESS" ]; then
    set -x
fi

# Set the default setup during prebuild process
if [ -n "$GITPOD_HEADLESS" ]; then
    FARMOS_REPO='https://github.com/farmOS/farmOS.git'
    FARMOS_VERSION='2.x'
    FARMOS_PROJECT_REPO='https://github.com/farmOS/composer-project.git'
    FARMOS_PROJECT_VERSION='2.x'
fi

# Build the development docker image with correct arguments.
docker build \
  --build-arg FARMOS_REPO=$FARMOS_REPO \
  --build-arg FARMOS_VERSION=$FARMOS_VERSION \
  --build-arg PROJECT_REPO=$FARMOS_PROJECT_REPO \
  --build-arg PROJECT_VERSION=$FARMOS_PROJECT_VERSION \
  --build-arg WWW_DATA_ID="$(id -u)" \
  https://github.com/farmOS/farmOS.git#2.x:docker/dev \
  -t farmos/farmos:2.x-dev \