#!/bin/bash

# This script handles renaming the configuration parts within the Dockerfile and docker-compose.yml file to
# ensure that the <APP> instances are all replaced with the application name via user provided parameter.

# Check number of arguments and exit if incorrect
if [[ "$#" -ne 0 ]]; then
  echo "Please run without providing arguments - they are not necessary."
  else
    # Assign current base directory to a variable to pass to sed for replacement purposes.
    APPDIR=$(basename $(pwd))
    sed -i "s/<APP>/${APPDIR}/g" ./{Dockerfile,docker-compose.yml}
fi
