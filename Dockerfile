#FROM registry.cn-hangzhou.aliyuncs.com/xuweiguo/newdomain:latest
FROM php:7.4-fpm-alpine3.10
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN set -x && \
    apk --update add bash grep  wget icu icu-libs  icu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl 
RUN rm -rf /var/cache/apk/*
