FROM xiaobu191/php-7.4.33-cli

SHELL ["/bin/sh", "-cex"]

WORKDIR /root

COPY pm2-install.sh *.php *.js *.json ./

# https://blog.csdn.net/qq_41980563/article/details/88876874
RUN apk --update add --no-cache procps

RUN ./pm2-install.sh

CMD ["pm2-runtime", "start", "apps.json"]