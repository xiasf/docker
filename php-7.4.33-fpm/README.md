## 使用说明

### 构建镜像

**xiaobu191/php-7.4.33-fpm**

基于 官方 `php:7.4.33-fpm-alpine3.16` ，并安装了常用扩展。

```shell
docker build -t xiaobu191/php-7.4.33-fpm -f Dockerfile-php-7.4.33-fpm .

docker push xiaobu191/php-7.4.33-fpm
```

doc:
    https://hub.docker.com/_/php
    https://github.com/mlocati/docker-php-extension-installer

