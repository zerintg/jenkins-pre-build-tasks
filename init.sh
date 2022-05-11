#!/bin/bash

echo "[DEBUG]"
date
printenv                                                   
tree || true

if which docker; then
  echo "[DOCKER CLEANUP]"
  docker ps -q | grep -qE '*' && docker stop $(docker ps -q)
  docker ps -aq | grep -qE '*' && docker rm $(docker ps -aq)
fi

# TODO WORKSPACE MIGHT BE SHADOW NAME
WORKSPACE="$(pwd | grep -oE '.*/remote-root/workspace')"
if [[ "$WORKSPACE" ]]; then
  echo "[WORKSPACE CLEANUP]"
  WORKSPACE="$WORKSPA"
  rm -vrf $WORKSPACE/*
else
  echo "Not building in the workspace! If you don't know \
  what caused this error, please contact the Jenkins admin." 
  exit 1
fi
