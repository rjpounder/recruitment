FROM php:7.1-fpm

RUN buildDeps="libpq-dev libzip-dev libicu-dev" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends

RUN docker-php-ext-install \
    pdo \
    pdo_mysql \
    mysqli

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

WORKDIR /var/www/test/

COPY . .

CMD bash -c "composer install"