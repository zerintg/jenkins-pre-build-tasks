#!/bin/bash

# Debug
printenv                                                   
tree || true

# Cleanup
docker ps -q | grep -qE '*' && docker stop $(docker ps -q)
docker ps -aq | grep -qE '*' && docker rm $(docker ps -aq)
