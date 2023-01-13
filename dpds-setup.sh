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
if [[ "$#" -ne 2 ]]
then
  echo "This script requires two arguments - django project name and django app name."
  echo "The django app name SHOULD be different than your Django project name to avoid confusion."
  echo "Exiting....."
  exit 1
  if [[ "${1}" == "${2}" ]]
  then
    echo "Project name and App name are the same. Please use different names to avoid confusion."
    exit 1
  fi
fi

# Clean up curl installation and unzip clutter
rm -rf ./django_postgresql_docker_start-main
rm ./README.md
rm ./tmp.zip

# GLOBALS
PROJ_NAME="${1}"
APP_NAME="${2}"

# Generate Django app and fix Docker files based on app name
django-admin startproject ${PROJ_NAME}
cd ./${PROJ_NAME}
python manage.py startapp ${APP_NAME}
