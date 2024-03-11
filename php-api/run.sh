#!/bin/sh

echo -e 'start build\n' \
  && docker build -t xiaobu191/php-api --target=api -f Dockerfile-php-api . \
  && docker build -t xiaobu191/php-api-nginx --target=nginx -f Dockerfile-php-api . \
  && echo -e '\nstart up\n' \
  && docker compose up

exit 0
