#FROM php:7.4-fpm-alpine3.10
FROM registry.cn-hangzhou.aliyuncs.com/xuweiguo/newdomain:latest
RUN docker-php-ext-install intl
