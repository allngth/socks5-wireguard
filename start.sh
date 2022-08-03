#!/bin/sh

exec docker run \
    --rm --tty --interactive \
    --name=wireguard-socks-proxy-0 \
    -p 0.0.0.0:1900:1080 \
    -p 41100:40000/udp \
    -e WG_ADDRESS='10.0.0.1/32' \
    -e WG_SERVER_PRIVATE_KEY='6Gp7b6JPSpTony2tQtEF1wGJHMa3VptoMCy+BGHnInI=' \
    -e WG_CLIENT_PUBLIC_KEY='x/WxCyDTn50an4zINhsnRESBMI3Zwnm6A0l4+/H9eAc=' \
    --privileged=1 \
    proxy/proxy