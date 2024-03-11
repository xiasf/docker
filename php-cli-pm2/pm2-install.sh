#!/bin/sh

set -e

apk --update add --no-cache nodejs-current npm

npm install pm2 -g \
    && npm cache clean --force

exit 0