# Stage 1: Build
FROM docker.io/php:7.3-fpm-bullseye AS build
COPY --from=composer:2.7.7 /usr/bin/composer /usr/bin/composer
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod 0755 /usr/local/bin/install-php-extensions
RUN install-php-extensions gd mysqli opcache zip
RUN docker-php-ext-enable gd mysqli opcache zip
ARG USER_ID=1000
ARG GROUP_ID=1000
RUN deluser www-data 2>/dev/null || true
RUN addgroup --gid ${GROUP_ID} www-data \
    && useradd --uid ${USER_ID} --gid www-data -d /var/www-data -s /usr/sbin/nologin -M www-data
USER www-data
EXPOSE 9000
CMD ["php-fpm"]