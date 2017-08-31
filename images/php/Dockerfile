FROM php:7.0.20-fpm

# Updating
RUN apt-get update /
    && apt-get upgrade -y 

# Install bcmath
RUN docker-php-ext-install bcmath

# Install GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Install mcrypt
RUN apt-get install -y libmcrypt-dev
RUN docker-php-ext-install mcrypt

#Install PDO
RUN docker-php-ext-install pdo_mysql

# Install XSL
RUN apt-get install -y libxslt-dev
RUN docker-php-ext-install xsl

# Install intl
RUN apt-get install -y libicu-dev
#RUN pecl install intl
RUN docker-php-ext-install intl

# Install zip
RUN docker-php-ext-install zip

# Install opcache
RUN docker-php-ext-install opcache

# Install memcache
RUN apt-get update && apt-get install -y libmemcached-dev zlib1g-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached

# Install xdebug
RUN pecl install xdebug-2.5.0 \
    && docker-php-ext-enable xdebug

# Install Imagick
RUN apt-get install -y libmagickwand-dev libmagickcore-dev \
    && pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick

# Install Node.js
RUN apt-get install -y nodejs

# Install npm
RUN apt install -y npm

# Install grunt
# RUN npm install -g grunt-cli
#RUN npm install
#RUN npm update

#RUN pip3 install mage2gen

# Clear cache
RUN apt-get clean
RUN apt-get purge -y --auto-remove

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
#/var/www/.composer/auth.json 

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

# Set www-data as owner for /var/www
RUN chown -R www-data:www-data /var/www/
RUN chmod -R g+w /var/www/
