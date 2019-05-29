# LAMP
#
# VERSION   1.0

# Ref.: https://hub.docker.com/_/php/
FROM php:7.0-apache

ENV APACHE_RUN_USER=www-data \
    APACHE_RUN_GROUP=www-data \
    APACHE_LOG_DIR=/var/log/apache2 \
    APACHE_PID_FILE=/var/run/apache2.pid \
    APACHE_RUN_DIR=/var/run/apache2 \
    APACHE_LOCK_DIR=/var/lock/apache2 \
    APACHE_SERVERADMIN=admin@localhost \
    APACHE_SERVERNAME=localhost \
    APACHE_SERVERALIAS=docker.localhost \
    APACHE_DOCUMENTROOT=/var/www/html \
    APACHE_LOG_DIR=/var/log/apache2

ENV DEBIAN_FRONTEND noninteractive

RUN a2enmod rewrite headers

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq\
        curl \
        git \
        libpng-dev \
        libjpeg-dev \
        libmcrypt-dev \
        wget \
        zlib1g-dev \
        locales \
        build-essential \
        ca-certificates \
        libcurl4-openssl-dev \
        libffi-dev \
        libgdbm-dev \
        libpq-dev \
        libreadline6-dev \
        libssl-dev \
        libtool \
        libxml2-dev \
        libxslt-dev \
        libyaml-dev \
        software-properties-common \
        wget \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-configure gd --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mysqli zip gettext intl


#Install and enable xdebug
RUN pecl install xdebug-2.5.0 \
    && docker-php-ext-enable xdebug

# Install intl     #php7.0-intl
#RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y libicu-dev \
#    && docker-php-ext-install -j$(nproc) intl

# Configure timezone and locale
RUN echo "Europe/Paris" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN locale-gen
ENV LANGUAGE=en_US.UTF-8
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV locale-gen=en_US.UTF-8

COPY website.conf /etc/apache2/sites-available/000-default.conf
COPY php.ini /usr/local/etc/php/conf.d/
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Clean up APT and temporary files when done
RUN apt-get clean -qq && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["${APACHE_DOCUMENTROOT}"]
EXPOSE 80 443
