# django_postgresql_docker_start

A simple way to enhance the Django/PostgreSQL/Docker development process. 

## Description

This project is used to create a more mature development process for Django web applications and/or RESTful APIs. It strives to do this
by leveraging Docker and PostgreSQL (A very common/mature relational database) in an easy to understand yet hyper flexible manner.

One of the key features of this project is the addition of a manage.py command this project provides called "wait_for_db" which avoids
the race condition where Django assumes the database is available because the service is started when in fact the actual database may still be
propagating. This ensures we don't encounter any race condition exceptions.

Once a project is started via the installation process container-based development and deployment can commence and will be outlined below.

## Getting Started

### Dependencies

* Django - Any current install will work. See 
https://www.djangoproject.com/download/
* Docker - Any modern version should be fine. See 
https://docs.docker.com/get-docker/

### Installing
* Ensure you are in an empty directory where you are ready to start work.
* Copy the below string and replace <DJANGO_PROJECT> with your own project name.
* If you don't change <DJANGO_PROJECT> with your own argument you will throw a bash exception.
```
curl -L -o tmp.zip https://github.com/anthony-hopkins/django_postgresql_docker_start/archive/refs/heads/main.zip && unzip tmp.zip && cp -a ./django_postgresql_docker_start-main/. . && bash ./dpds-setup.sh <DJANGO_PROJECT>
```
* The script that is called handles building the Django project as well as providing proper docker and Django configurations.
* After the script is ran you should see similar output based on your own project name:
```
AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ curl -L -o tmp.zip https://github.com/anthony-hopkins/django_postgresql_docker_start/archive/refs/heads/main.zip && unzip tmp.zip && cp -a ./django_postgresql_docker_start-main/. . && bash ./dpds-setup.sh testing_app
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed  
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0 
100  7179    0  7179    0     0  12054      0 --:--:-- --:--:-- --:--:-- 12054
Archive:  tmp.zip
cdc3de9c4e76927f7864d72c8436708f49e13bb2                                                  
   creating: django_postgresql_docker_start-main/                                         
  inflating: django_postgresql_docker_start-main/Dockerfile                               
  inflating: django_postgresql_docker_start-main/README.md                                
   creating: django_postgresql_docker_start-main/core/                                    
   creating: django_postgresql_docker_start-main/core/management/                         
 extracting: django_postgresql_docker_start-main/core/management/__init__.py              
   creating: django_postgresql_docker_start-main/core/management/commands/                
 extracting: django_postgresql_docker_start-main/core/management/commands/__init__.py     
  inflating: django_postgresql_docker_start-main/core/management/commands/wait_for_db.py  
  inflating: django_postgresql_docker_start-main/docker-compose.yml                       
  inflating: django_postgresql_docker_start-main/dpds-setup.sh
  inflating: django_postgresql_docker_start-main/requirements.txt
  inflating: django_postgresql_docker_start-main/settings.py

AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$

```
* The called script handles cleaaning the project structure up after it finished building the necessary hierarchy.
* You should now see a directory structure like the following:
```
AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth                                                              
total 6.0K                                                                  
-rw-r--r-- 1 AnthonyHopkins 4096  74 Jan 13 18:04 requirements.txt  
drwxr-xr-x 1 AzureAD+AnthonyHopkins 4096   0 Jan 13 18:04 testing_app       
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 586 Jan 13 18:04 Dockerfile        
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 641 Jan 13 18:04 docker-compose.yml

AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/                                               
total 5.0K                                                           
drwxr-xr-x 1 AzureAD+AnthonyHopkins 4096   0 Jan 13 18:04 core       
-rwxr-xr-x 1 AzureAD+AnthonyHopkins 4096 689 Jan 13 18:04 manage.py  
drwxr-xr-x 1 AzureAD+AnthonyHopkins 4096   0 Jan 13 18:04 testing_app

AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/testing_app/                                   
total 10K
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096  415 Jan 13 18:04 asgi.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096  774 Jan 13 18:04 urls.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096  415 Jan 13 18:04 wsgi.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096    0 Jan 13 18:04 __init__.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 3.4K Jan 13 18:04 settings.py

AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/core/management/
__init__.py  commands/    

AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/core/management/
total 1.0K
drwxr-xr-x 1 AzureAD+AnthonyHopkins 4096 0 Jan 13 18:04 commands
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 1 Jan 13 18:04 __init__.py

AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing
$ ls -lrth ./testing_app/core/management/commands/
total 5.0K
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096 839 Jan 13 18:04 wait_for_db.py
-rw-r--r-- 1 AzureAD+AnthonyHopkins 4096   1 Jan 13 18:04 __init__.py

AnthonyHopkins@DESKTOP-4AC785K MINGW64 ~/PycharmProjects/testing

```

## How it all works!
Now that you have a project structure to develop code in you can run the following to initialize your Django environment and ensure everything is healthy
```
docker-compose up
```
* This will build and start the Django application. The provided output if successful will tell you to visit 0.0.0.0:8000.
* To verify the application built successfully in the container and all went well you can visit: http://127.0.0.1:8000
* If you see the default django landing page you know everything went well! You are now ready to start writing your own Django apps!
* In order to change your database settings you need to change the environment variables within the docker-compose.yml file located at the root of the project.
* Currently only PostgreSQL is supported by this process. You really shouldn't need another database for most projects.

Simply add Django logic to the Django project directory through new modules and files/directories and run "docker-compose up" to 
test your changes. Your code will be injected into the container ecosystem and ran from there. This allows easy deployment and collaboration!

## Authors

Contributors names and contact info

Anthony Hopkins - anthony.b.hopkins@gmail.com

## Acknowledgments

Shout out to these guys for basically providing a sweet README.md template:
* [awesome-readme](https://github.com/matiassingers/awesome-readme)
