# docker-demp

## Settings

```
cp .env.example .env
cp docker-compose.yml.example docker-compose.yml
docker compose up -d --build
```

## Useful commands line

```
# Copy configuration from docker image to host machine
docker run -it --name test1 --rm php:7.3.33-fpm-alpine3.15
docker cp test1:/usr/local/etc/php php7.3_copy

docker run -it --name test2 --rm docker.io/nginx:1.27.0-alpine3.19-slim
docker cp test2:/etc/nginx nginx_copy

# Build image
docker build -t phamphu232/php:7.3.33-fpm-alpine3.15 -f ./php.Dockerfile .
docker push phamphu232/php:7.3.33-fpm-alpine3.15
```