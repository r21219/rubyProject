#!/bin/sh

APP="/ruby"
DOCKER_IMAGE="registry.gitlab.railsformers.com/osu/osu-rails-7"
USER_ID=`id -u`
GROUP_ID=`id -g`
USER_MAP="-u $USER_ID:$GROUP_ID"
USER_MAP_ENABLED="false" # false
BASE_CMD="docker run --rm -it -v $PWD:$APP $($USER_MAP_ENABLED && echo $USER_MAP) --add-host=host.docker.internal:host-gateway"
EXPOSE_PORT="-p 3000:3000"

if [ $# -eq 0 ]
then
  eval "$BASE_CMD $EXPOSE_PORT $DOCKER_IMAGE"
else
  eval "$BASE_CMD $DOCKER_IMAGE $@"
fi
