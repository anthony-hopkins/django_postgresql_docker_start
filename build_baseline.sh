#!/bin/bash

# This script handles renaming the configuration parts within the Dockerfile and docker-compose.yml file to
# ensure that the <APP> instances are all replaced with the application name via user provided parameter.

# Check number of arguments and exit if incorrect
if [[ "$#" -ne 1 ]]; then
  echo "Invalid number of arguments. Only provide the name of the Django app."
  else
    sed -i "s/<APP>/${1}/g" ./{Dockerfile,docker-compose.yml}
fi
