#!/bin/sh

APP="/ruby"
DOCKER_IMAGE="registry.gitlab.railsformers.com/osu/osu-rails-7"
BASE_CMD="docker run --rm -it -v \"$(pwd -W):$APP\" --add-host=host.docker.internal:host-gateway -e WINDIR"
EXPOSE_PORT="-p 3000:3000"

if [ $# -eq 0 ]
then
  eval "$BASE_CMD $EXPOSE_PORT $DOCKER_IMAGE"
else
  eval "$BASE_CMD $DOCKER_IMAGE $@"
fi
