#FROM php:7.4-fpm-alpine3.10
FROM registry.cn-hangzhou.aliyuncs.com/xuweiguo/newdomain:latest
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache icu
RUN docker-php-ext-install intl
