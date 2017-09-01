FROM php:7.0.23-fpm

# Updating and installing some dependences
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
    libmcrypt-dev libxslt-dev libicu-dev libmemcached-dev zlib1g-dev \
    libmagickwand-dev libmagickcore-dev nodejs npm git

# Install PHP extensions
RUN docker-php-ext-install bcmath \
    mcrypt \
    pdo_mysql \
    xsl \
    intl \
    zip \
    opcache

# Install GD
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Install pecl modules
RUN pecl install \
    memcached \
    xdebug-2.5.0 \
    imagick-3.4.3 && \
    docker-php-ext-enable memcached \
    xdebug \
    imagick

# Clear cache
RUN apt-get clean && \
    apt-get purge -y --auto-remove

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
#/var/www/.composer/auth.json 

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# Set www-data as owner for /var/www
RUN chown -R www-data:www-data /var/www/ && \
    chmod -R g+w /var/www/