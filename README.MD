# Socks5-wireguard

This repository presents how you can direct all traffic from proxy to WireGuard.

## Generate keys for WireGuard

```shell
umask 077; wg genkey | tee privatekey | wg pubkey > publickey
cat privatekey
cat publickey
```

## Start proxy server

For start proxy use this command:

```shell
docker run \
    --rm -d \
    --name=wireguard-socks-proxy-0 \
    -p 0.0.0.0:1900:1080 \
    -p 41100:40000/udp \
    -e WG_ADDRESS='10.0.0.1/32' \
    -e WG_SERVER_PRIVATE_KEY='6Gp7b6JPSpTony2tQtEF1wGJHMa3VptoMCy+BGHnInI=' \
    -e WG_CLIENT_PUBLIC_KEY='x/WxCyDTn50an4zINhsnRESBMI3Zwnm6A0l4+/H9eAc=' \
    -e PROXY_LOGIN='some_login' \
    -e PROXY_PASSWORD='some_password' \
    --privileged=1 \
    allngth/socks5-wireguard
```

- 0.0.0.0:1900:1080 - direct all traffic from external 1900 port to socks5 proxy inside docker container
- 41100:40000/udp - used to establish connection between your server inside docker container and client
- WG_ADDRESS - docker container VPN tunnel address
- WG_SERVER_PRIVATE_KEY - docker container VPN private key (generates on step before)
- WG_CLIENT_PUBLIC_KEY - client VPN public key (generates on client side)
- PROXY_LOGIN - optional, proxy login
- PROXY_PASSWORD - optional, proxy password