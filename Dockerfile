FROM alpine:3.19

# ENVIRONMENT
ARG GRAV_VERSION="1.7.44"
ARG ALPINE_VERSION="3.19"
ARG PHP_VERSION="8.2"
ARG WEB_DOMAIN="rcosta.uk"
ARG BUILD_DATE="12-MAR-2024"

# AUTHOR
LABEL maintainer="Raul Costa <raul@rcosta.uk>"
LABEL description="Alpine + Nginx + PHP for Grav CMS" \
      architecture="amd64/x86_64" \
      alpine-version="3.19" \
      grav-version="1.7.44" \
      nginx-version="1.25.4" \
      php-version="8.1.27" \
      build="${BUILD_DATE}" \
      org.opencontainers.image.authors="Raul Costa <raul@rcosta.uk>" \
      org.opencontainers.image.source="https://github.com/rcosta-uk/alpine-nginx-grav"

# INSTALLING
RUN apk add --no-cache --update  \
    nginx unzip curl git nano net-snmp-tools tzdata php \
    php-xml \
    php-dom \
    php-gd \
    php-fpm \
    php-zip \
    php-apcu \
    php-tokenizer \
    php-common \
    php-session \
    php-xmlreader \
    php-curl \
    php-ctype \
    php-dom \
    php-json \
    php-openssl \
    php-mbstring \
    php-simplexml \
    && rm -rf /var/cache/apk/*

# USER SETUP
RUN adduser -D -g 'Ubuntu User' -u 1001 ubuntu
RUN addgroup ubuntu tty

# CONFIGING NGINX
ADD extra/nginx.conf /etc/nginx/nginx.conf
ADD extra/domain.conf /etc/nginx/http.d/domain.conf
ADD extra/default.conf /etc/nginx/http.d/default.conf

# CONFIGURING PHP-FPM
RUN rm -v /etc/php82/php-fpm.d/www.conf
ADD extra/fpm-pool.conf /etc/php82/php-fpm.conf
ADD extra/php.ini /etc/php82/conf.d/custom.ini

# STARTING
ADD extra/entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

# EXPOSING
EXPOSE 80
VOLUME ["/var/www/html"]

HEALTHCHECK --interval=5m --timeout=4s CMD curl --silent --fail http://localhost/ping 

