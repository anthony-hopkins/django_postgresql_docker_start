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

if [[ "$#" -ne 2 ]]
then
  echo "This script requires two arguments - django project name and django app name."
  echo "Those names must be unique."
else
  if [[ "${1}" == "${2}" ]]
  then
    echo "Arguments MUST be unique to avoid confusion. /app/app/app format is gross."
    exit 1
  fi
fi

PROJECT_NAME="${1}"
APP_NAME="${2}"

django-admin startproject ${PROJECT_NAME}
