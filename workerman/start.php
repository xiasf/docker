<?php

// $: php start.php start

use Workerman\Timer;
use Workerman\Worker;

include __DIR__ . '/vendor/autoload.php';

$worker = new Worker();

$worker->onWorkerStart = function ($worker) {
    Timer::add(1, function () {
        echo date('Y-m-d H:i:s') . PHP_EOL;
    });
};

Worker::runAll();
