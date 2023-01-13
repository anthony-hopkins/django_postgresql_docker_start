# django_postgresql_docker_start

A simple way to enhance the Django/PostgreSQL/Docker development process. 

## Description

This project is used to create a more mature development process for Django web applications and/or RESTful APIs. It strives to do this
by leveraging Docker and PostgreSQL (A very common/mature relational database) in an easy to understand yet hyper flexible manner.

docker-compose is used heavily during the development process 

## Getting Started

### Dependencies

* Django>=3.2.4 (Any version SHOULD work for just creating a base project/app structure)
* Docker version 20.10.21 (Any modern Docker version should work).

### Installing
* Copy the below string and replace <DJANGO_PROJECT> and <DJANGO_APP> with your own project and app names.
* Ensure that the project name and the app name are unique to avoid directory confusion. 

```
curl -L -o tmp.zip https://github.com/anthony-hopkins/django_postgresql_docker_start/archive/refs/heads/main.zip && unzip tmp.zip && cp -a ./django_postgresql_docker_start-main/. . && bash ./dpds-setup.sh <DJANGO_PROJECT> <DJANGO_APP>
```

### Generating your Django project

* Create a fresh Django project to create the project/app structure.
```
django-admin startproject mysite
```

### Executing the build_baseline script to normalize the Docker files.

* Run the build_baseline.sh script to replace <APP> entries in the Docker files with the proper application name.
```
bash ./build_baseline.sh
```

## How it all works!

## Authors

Contributors names and contact info

Anthony Hopkins - anthony.b.hopkins@gmail.com

## Acknowledgments

Shout out to these guys for basically providing a sweet README.md template:
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
