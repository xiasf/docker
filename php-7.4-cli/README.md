## 使用说明

### 构建镜像

**xiaobu191/php-7.4-cli**

基于 官方 `xiaobu191/php-7.4.33-cli` ，并安装了常用扩展。

```shell
docker build -t xiaobu191/php-7.4-cli -f Dockerfile-php-7.4-cli .

docker push xiaobu191/php-7.4-cli
```
