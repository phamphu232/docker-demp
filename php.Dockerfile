# Stage 1: Build
FROM docker.io/php:7.3.33-fpm-alpine3.15 AS build
COPY --from=composer:2.7.7 /usr/bin/composer /usr/bin/composer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod 0755 /usr/local/bin/install-php-extensions
RUN install-php-extensions gd mysqli opcache zip
RUN docker-php-ext-enable gd mysqli opcache zip
ARG UID=1000
ARG GID=1000
RUN deluser www-data 2>/dev/null || true
RUN addgroup -g ${GID} www-data \
    && adduser -u ${UID} -G www-data -h /home/www-data -s /sbin/nologin -D www-data
USER www-data
EXPOSE 9000
CMD ["php-fpm"]