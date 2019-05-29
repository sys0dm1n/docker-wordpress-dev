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
    $ cp wp-config.php
    $ vim wp-config.php
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