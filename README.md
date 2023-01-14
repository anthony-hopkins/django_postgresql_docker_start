# django_postgresql_docker_start

A simple way to enhance the Django/PostgreSQL/Docker development process. 

## Description

This project is used to create a more mature development process for Django web applications and/or RESTful APIs. It strives to do this
by leveraging Docker and PostgreSQL (A very common/mature relational database) in an easy to understand yet hyper flexible manner.

One of the key features of this project is the addition of a manage.py command this project provides called "wait_for_db" which avoid
the race condition where Django assumes the database is available because the service is started when in fact the actual database may still be
propagating. This ensures we don't encounter any race condition exceptions.

Once a project is started via the installation process container-based development and deployment can commence and will be outlined below.

## Getting Started

### Dependencies

* Django>=3.2.4 (Any version SHOULD work for just creating a base project/app structure)
* Docker version 20.10.21 (Any modern Docker version should work).

### Installing
* Ensure you are in an empty directory where you are ready to start work.
* Copy the below string and replace <DJANGO_PROJECT> with your own project name.
```
curl -L -o tmp.zip https://github.com/anthony-hopkins/django_postgresql_docker_start/archive/refs/heads/main.zip && unzip tmp.zip && cp -a ./django_postgresql_docker_start-main/. . && bash ./dpds-setup.sh <DJANGO_PROJECT>
```
* The script that is called handles building the django project as well as providing proper docker configurations.
* You should now see a directory structure like the following:
```AzureAD+AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth                                                              
total 6.0K                                                                  
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096  74 Jan 13 18:04 requirements.txt  
drwxr-xr-x 1 AzureAD+AnthonyHopkins 4096   0 Jan 13 18:04 testing_app       
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 586 Jan 13 18:04 Dockerfile        
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 641 Jan 13 18:04 docker-compose.yml

AzureAD+AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/                                               
total 5.0K                                                           
drwxr-xr-x 1 AzureAD+AnthonyHopkins 4096   0 Jan 13 18:04 core       
-rwxr-xr-x 1 AzureAD+AnthonyHopkins 4096 689 Jan 13 18:04 manage.py  
drwxr-xr-x 1 AzureAD+AnthonyHopkins 4096   0 Jan 13 18:04 testing_app

AzureAD+AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/testing_app/                                   
total 10K
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096  415 Jan 13 18:04 asgi.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096  774 Jan 13 18:04 urls.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096  415 Jan 13 18:04 wsgi.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096    0 Jan 13 18:04 __init__.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 3.4K Jan 13 18:04 settings.py

AzureAD+AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/core/management/
__init__.py  commands/    

AzureAD+AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/core/management/
total 1.0K
drwxr-xr-x 1 AzureAD+AnthonyHopkins 4096 0 Jan 13 18:04 commands
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 1 Jan 13 18:04 __init__.py

AzureAD+AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/core/management/commands/
total 5.0K
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 839 Jan 13 18:04 wait_for_db.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096   1 Jan 13 18:04 __init__.py

AzureAD+AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing

```

## How it all works!

## Authors

Contributors names and contact info

Anthony Hopkins - anthony.b.hopkins@gmail.com

## Acknowledgments

Shout out to these guys for basically providing a sweet README.md template:
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
