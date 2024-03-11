<?php

while (true) {
    echo date('Y-m-d H:i:s')  . ' '. join(' ', $argv) . PHP_EOL;
    sleep(1);
}
