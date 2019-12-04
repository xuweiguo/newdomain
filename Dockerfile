#FROM registry.cn-hangzhou.aliyuncs.com/xuweiguo/newdomain:latest
FROM php:7.4-fpm-alpine3.10
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
#apk --update add curl  zlib-dev freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev  libxml2-dev
RUN set -x && \
    apk --update add bash grep  wget curl \
    icu icu-libs  icu-dev \
    zlib-dev freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure gd  --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/   --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pdo_mysql gd
    
RUN rm -rf /var/cache/apk/*

# php.ini 去除expose_php 设置 
