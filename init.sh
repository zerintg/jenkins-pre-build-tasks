#!/bin/bash

echo "[DEBUG]"
date
printenv                                                   
tree || true

if which docker; then
  echo "[DOCKER CLEANUP]"
  docker ps -q | grep -qE '.+' && docker stop $(docker ps -q)
  docker ps -aq | grep -qE '.+' && docker rm $(docker ps -aq)
fi
