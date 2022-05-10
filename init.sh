#!/bin/bash

echo "[DEBUG]"
date
printenv                                                   
tree || true
echo '\n\n\n'

echo "[CLEANUP]"
docker ps -q | grep -qE '*' && docker stop $(docker ps -q)
docker ps -aq | grep -qE '*' && docker rm $(docker ps -aq)
echo '\n\n\n'
