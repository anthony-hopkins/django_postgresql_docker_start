#!/bin/bash

# This script is responsible for establishing a good baseline for new projects. It builds a django
# project and app and then dynamically updated the associated docker files with the application directory
# required for container volume mappings.
#
# This script takes two arguments:
# 1- The name of the django project
# 2 - THe name of the first app for the django project.
#
# Both of the above arguments need to be unique and can not be the same as a built in Python module.

# ARGS check for sanity.
if [[ "$#" -ne 1 ]]
then
  echo "This script requires one argument - django project name."
  echo "Exiting....."
  exit 1
fi

# Clean up curl installation and unzip clutter
rm -rf ./django_postgresql_docker_start-main
rm ./README.md
rm ./tmp.zip

# GLOBALS
PROJ_NAME="${1}"

# Generate Django app and fix Docker files based on app name
django-admin startproject ${PROJ_NAME}

# Move core directory tino Django project directory so the wait_for_db command becomes available to manage.py
mv ./core ./${PROJ_NAME}

# Use sed to replace <APP> with out Django project name to ensure our Docker files are properly configured. 
sed -i "s/<APP>/${PROJ_NAME}/g" ./{Dockerfile,docker-compose.yml}
