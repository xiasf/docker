## 说明

使用 docker compose 演示一个完整的 php-fpm/nginx API 接口项目的构建和启动过程。

一键构建并运行（如果您想重新构建镜像）：

```shell
$: chmod +x ./run.sh && ./run.sh
```

----

### 1. 构建

> 如果您只是想运行，可以跳过此步。

多阶段构建镜像：

```shell
$: cd php-api

# build xiaobu191/php-api (fpm) images
$: docker build -t xiaobu191/php-api --target=api -f Dockerfile-php-api .

# build xiaobu191/php-api-nginx (nginx) images
$: docker build -t xiaobu191/php-api-nginx --target=nginx -f Dockerfile-php-api .
```

----

### 2. 运行

**方式一: 一键启动服务（建议）**

```shell
$: cd php-api

$: docker compose up

$: docker compose ps

$: docker compose top

$: docker compose port nginx 80
$: docker compose port phpfpm 9000

$: docker port php-api-nginx-1
$: docker port php-api-phpfpm-1
```

**方式二: 单独启动**

```
# 创建 数据卷
$: docker volume create apps_share_data
$: docker volume ls

# 创建网络（用于容器互联）
$: docker network create -d bridge phpfpm-network
```

```shell
$: docker run -d \
    --name php-api-phpfpm \
    # 使用 docker network ，无需直接对外暴露端口
    # -p 9000:9000 \
    --network phpfpm-network \
    # 将数据据 apps_share_data 挂载到容器内目录，使应用运行数据保存在容器外部
    -v apps_share_data:/home/myweb/apps_share_data \
    # 当需要替换容器内配置时
    # -v /path-on-host-machine/www.conf:/usr/local/etc/php-fpm.d/www.conf \
    xiaobu191/php-api
```

```shell
$: docker run -d \
    --name php-api-nginx \
    -p 80:80 \
    --network phpfpm-network \
    # 当需要替换容器内配置时
    # -v /path-on-host-machine/nginx.conf:/etc/nginx.conf \
    # -v /path-on-host-machine/admin.api.yf5g.cn.conf:/etc/nginx/conf.d/ \
    xiaobu191/php-api-nginx
```

进入容器调试：

```shell
$: docker exec -it php-api-nginx-1 sh

$: docker exec -it php-api-phpfpm-1 sh
```

### 3. 验证

可以在宿主上做如下测试：
~~~
http://localhost

http://localhost/index.php

http://localhost/xiaobu.jpg
http://localhost/xiaobu2.jpg

http://localhost/phpfpm_status
http://localhost/phpfpm_ping

nc -z -w 1 127.0.0.1 9000 && echo 1

nc -z -w 1 127.0.0.1 80 && echo 1
~~~

> 宿主只需要开放 80 端口就可以了。

```shell
$: docker volume inspect apps_share_data

# 容器名称: 项目名称-服务名称-序号
$: docker inspect php-api-phpfpm-1
```

----

### 4. 其它说明

nginx 的配置目录:
~~~
/etc/nginx/nginx.conf
/etc/nginx/conf.d/*.conf
~~~

php-fpm 的配置目录:
~~~
/usr/local/etc/php-fpm.conf
/usr/local/etc/php-fpm.d/*.conf
~~~


查看日志:

```shell
$: docker logs php-api-phpfpm-1 -f

$: docker logs php-api-nginx-1 -f
```
