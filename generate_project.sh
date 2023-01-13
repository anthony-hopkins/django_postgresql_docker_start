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
  echo "This script requires one argument - django app name."
  echo "This name SHOULD be different than uyour Django project to avoid confusion."
  echo "Exiting....."
  exit 1
fi

# GLOBALS
APP_NAME="${1}"

# CLeanup from curl installation
rm -rf ./django_postgresql_docker_start-main
rm ./main.zip
rm ./README.md

# Generate Django app and fix Docker files based on app name
python manage.py startapp ${APP_NAME}
sed -i "s/<APP>/${APPNAME}/g" ./{Dockerfile,docker-compose.yml}
