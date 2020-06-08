FROM amazeeio/php:7.3-cli-v1.4.2

ARG COMPOSER_AUTH
ENV COMPOSER_AUTH $COMPOSER_AUTH

# Install the gRPC PHP extension.
RUN apk add --no-cache --virtual .build-deps \
        autoconf \
        build-base \
        linux-headers \
        php7-dev \
        php7-pear \
 && pecl install grpc > /dev/null \
 && apk del --no-cache .build-deps \
 && docker-php-ext-enable grpc
