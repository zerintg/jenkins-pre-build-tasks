#!/bin/bash

tree || true                         # List directory structure
rm -rf .                             # Cleaning working directory
docker stop $(docker ps -q) || true  # Stopping docker containers
docker rm $(docker ps -qa) || true   # Removing docker containers
