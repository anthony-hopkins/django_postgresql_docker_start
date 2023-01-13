#!/bin/bash

# This script handles renaming the configuration parts within the Dockerfile and docker-compose.yml file to
# ensure that the <APP> instances are all replaced with the application name via user provided parameter.

# Check number of arguments and exit if incorrect
if [[ "$#" -ne 2 ]]; then
  echo "Please provide your django project name and application name as seperate parameters."
  else
    if [[ "${1}" -eq "%{2}" ]]; then
      echo "Project name and application name should differ to avoid confusion. Trust me here..."
      echo "Please run again with unique names..."
      exit 1
    fi
    # Build new django project.
    django-admin startproject "${1}"
    # Build new Django app
    python manage.py startapp "${2}"
    # Assign current base directory to a variable to pass to sed for replacement purposes.
    APPDIR=$(2)
    sed -i "s/<APP>/${APPDIR}/g" ./{Dockerfile,docker-compose.yml}
    # Move the management directory to the current application directory to allow the use of the custom commands.
    mv ./management ./${APPDIR}/
    # Clean up the artifacts from the download and unzip process ran prior to this script.
    rm -rf ./{django_postgresql_docker_start-main,main.zip,README.md}
fi
