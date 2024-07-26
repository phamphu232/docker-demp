# Stage 1: Build
FROM docker.io/nginx:1.27.0-alpine3.19-slim AS build
ARG UID=1000
ARG GID=1000
RUN deluser nginx 2>/dev/null || true
RUN addgroup -g ${GID} nginx \
    && adduser -u ${UID} -G nginx -h /var/cache/nginx -s /sbin/nologin -D nginx
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]