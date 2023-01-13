# django-postgresql_docker_start

A simple way to enhance the Django/PostgreSQL/Docker development process. 

## Description

This process is designed to ease the use of using PostgreSQL and Docker in conjunction with Django to implement development
 (and potential testing) from within a docker container. This is a good way toi avoid the hassle of virtual environments 
 as well as ensures a consistent development environment that can be deployed anywhere docker is installed.

## Getting Started

### Dependencies

* Django>=3.2.4 (Any version SHOULD work for just creating a base project/app structure)
* Docker version 20.10.21 (Any modern Docker version should work).

### Installing

* No install required. Simply clone the repository!

### Executing program

* Create a fresh Django project to create the project/app structure.
```
django-admin startproject mysite
```
* Run the build_baseline.sh script to correct docker related files to use the proper project directories.
```
bash ./build_baseline.sh
```

## Authors

Contributors names and contact info

Anthony Hopkins - anthony.b.hopkins@gmail.com

## Acknowledgments

Inspiration, code snippets, etc.
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
