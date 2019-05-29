# docker-wordpress-dev
Docker environment for Wordpress development

# Steps to follow

1- Clone this repository

```bash
    $ git clone 
    $ cd docker-wordpress-dev
```

2- Download Wordpress

```bash
    $ wget http://wordpress.org/latest.tar.gz
    $ tar xfz latest.tar.gz
```

3- Edit/update wp-config.php

```bash
    $ cp wordpress/wp-config-sample.php wordpress/wp-config.php
    $ vim wordpress/wp-config.php
```

```bash
    /** The name of the database for WordPress */
    define('DB_NAME', 'wordpress');
    /** MySQL database username */
    define('DB_USER', 'wordpress');
    /** MySQL database password */
    define('DB_PASSWORD', 'wordpress');
    /** MySQL hostname */
    define('DB_HOST', 'mysql');
```

4- Starting your containers

```bash
    $ docker-compose up
```

5- Test your installation

Open http://localhost:8000/ in your favorite browser.

You should get the default Wordpress configuration page.

6- Updating the code

Try updating Wordpress code and refresh the page to see if the changes are applied instantly.

# Useful commands

## Deamon mode, pull images and build containers if any

    $ docker-compose up -d

##  Start containers

    $ docker-compose start

## Stop containers

    $ docker-compose stop

## Stop and delete containers

    $ docker-compose -s rm

## List running containers

    $ docker ps 

## List all containers

    $ docker ps -a

## Enter inside the container

    $ docker exec -it <container-name-or.container-ID> -f bash

## Logs

    $ docker logs  <container-name-or.container-ID> -f