<?php

if (!$_ENV['WG_ADDRESS'] || !$_ENV['WG_SERVER_PRIVATE_KEY'] || !$_ENV['WG_CLIENT_PUBLIC_KEY']) {
    throw new InvalidArgumentException('Missing required ENV variable');
}

$wgTemplatePath = '/etc/wireguard/wg0.conf';
$wgConfTemplate = file_get_contents($wgTemplatePath);
$wgConf = strtr($wgConfTemplate, [
    '#address' => $_ENV['WG_ADDRESS'],
    '#serverPrivateKey' => $_ENV['WG_SERVER_PRIVATE_KEY'],
    '#clientPublicKey' => $_ENV['WG_CLIENT_PUBLIC_KEY'],
]);

file_put_contents($wgTemplatePath, $wgConf);

$wgConfTemplate = file_get_contents($wgTemplatePath);

var_dump($wgConfTemplate);
