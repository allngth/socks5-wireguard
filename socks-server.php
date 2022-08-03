<?php

$login = $_ENV['PROXY_LOGIN'] ?? null;
$password = $_ENV['PROXY_PASSWORD'] ?? null;

require_once __DIR__ . '/vendor/autoload.php';

$auth = null;

if ($login && $password) {
    $auth = [
        $login => $password,
    ];
}

$socks = new Clue\React\Socks\Server(null, null, $auth);

$socket = new React\Socket\SocketServer('0.0.0.0:1080');
$socks->listen($socket);