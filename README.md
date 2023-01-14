# django_postgresql_docker_start

A simple way to enhance the Django/PostgreSQL/Docker development process. 

## Description

This project is used to create a more mature development process for Django web applications and/or RESTful APIs. It strives to do this
by leveraging Docker and PostgreSQL (A very common/mature relational database) in an easy to understand yet hyper flexible manner.

One of the key features of this project is the addition of a manage.py command this project provides called "wait_for"db" which avoid
the race condition where Django assumed the database is available because the service is started when in fact the actual database may still be
propogating. This ensures we don't encounter any race condition exceptions.

Once a project is started via the installation process container-based development and deployment can comence and will be outlined below.

## Getting Started

### Dependencies

* Django>=3.2.4 (Any version SHOULD work for just creating a base project/app structure)
* Docker version 20.10.21 (Any modern Docker version should work).

### Installing
* Ensure you are in a fresh directory where you are ready to start work.
* Copy the below string and replace <DJANGO_PROJECT> with your own project name.
* The script that is called at the end handles building the djangio project as well as providing proper docker configurations.
```
curl -L -o tmp.zip https://github.com/anthony-hopkins/django_postgresql_docker_start/archive/refs/heads/main.zip && unzip tmp.zip && cp -a ./django_postgresql_docker_start-main/. . && bash ./dpds-setup.sh <DJANGO_PROJECT>
```
* You should now see a directory structure like the following:
```

```

## How it all works!

## Authors

Contributors names and contact info

Anthony Hopkins - anthony.b.hopkins@gmail.com

## Acknowledgments

Shout out to these guys for basically providing a sweet README.md template:
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
