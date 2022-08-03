FROM php:8.1.8-cli-alpine3.15

RUN apk add --update-cache wireguard-tools

WORKDIR /home

COPY ./composer.json /home/composer.json
COPY ./composer.lock /home/composer.lock
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY ./entrypoint.sh /entrypoint.sh

COPY ./wg0.conf /etc/wireguard/wg0.conf

COPY ./init.php /home/init.php
COPY ./socks-server.php /home/socks-server.php

RUN composer install

ENTRYPOINT "/entrypoint.sh"