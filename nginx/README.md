## 使用说明

### 构建镜像

**xiaobu191/nginx**

```shell
docker build -t xiaobu191/nginx -f Dockerfile-nginx .

docker run --name webserver-xiaobu -d -p 8081:80 xiaobu191/nginx
```

基于 官方 `nginx:1.25.0-alpine3.17`
