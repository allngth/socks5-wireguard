#!/bin/sh

set -e

#init wg0.conf
php /home/init.php

# start WireGuard
wg-quick up /etc/wireguard/wg0.conf

# start proxy server
php /home/socks-server.php