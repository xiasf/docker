## 说明

php-7.4.33-cli + pm2 镜像

----

### 构建镜像

**xiaobu191/php-cli-pm2**

```shell
$: docker build -t xiaobu191/php-cli-pm2 -f Dockerfile .
```

----

### 使用方法

```shell
# 前台启动
$: pm2-runtime start apps.json

# 后台启动
$: pm2 start apps.json
$: pm2 list

$: pm2 monit

$: pm2 log
$: pm2 log test
$: pm2 flush

$: pm2 delete all

$: pm2 save
$: pm2 startup
```

更多用法见: https://pm2.keymetrics.io/docs/usage/startup/
