# syntax=docker/dockerfile:experimental
FROM xiaobu191/composer as composer

SHELL ["/bin/sh", "-cex"]

ENV COMPOSER_HOME=/var/composer \
    COMPOSER_CACHE_DIR=/var/composer/cache \
    COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /app

COPY composer.json composer.lock ./

# 声明缓存挂载点，并设置缓存对象id
RUN --mount=type=cache,id=composer_vendor,target=/app/vendor,sharing=locked \
    --mount=type=cache,id=composer_cache,target=/var/composer/cache,sharing=locked \
        composer install \
            --ignore-platform-reqs \
            --no-interaction \
            --no-plugins \
            --no-scripts \
            --prefer-dist \
            -vv

# 将缓存挂载到目标位置，并放到当前层镜像供下层镜像使用
#RUN --mount=type=cache,target=/app/vendor,id=composer_vendor,sharing=locked \
#        mkdir -p /tmp/vendor && cp -r /app/vendor/* /tmp/vendor


FROM xiaobu191/php-7.4.33-cli as app

WORKDIR /api

# 从上层镜像中复制文件过来
#COPY --from=composer /tmp/vendor ./vendor

# 将缓存挂载到目标位置
RUN --mount=type=cache,target=/app/vendor,id=composer_vendor \
        cp -r /app/vendor .

COPY *.php ./

CMD ["php", "start.php", "start"]
