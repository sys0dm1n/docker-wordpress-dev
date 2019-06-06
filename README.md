# docker-wordpress-dev
Docker environment for Wordpress development

# Requirements

1- Install git : https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

2- Install Docker: https://docs.docker.com/install/

3- Install Docker-compose: https://docs.docker.com/compose/install/

# Steps to follow

1- Clone this repository

```bash
    $ git clone git@github.com:sys0dm1n/docker-wordpress-dev.git
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

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
