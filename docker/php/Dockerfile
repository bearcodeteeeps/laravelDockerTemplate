FROM php:7.3-fpm

RUN apt-get update 
RUN apt-get install -y libssl-dev libfreetype6-dev libcurl3-dev libjpeg62-turbo-dev libcurl4-openssl-dev zlib1g-dev zip unzip git libpq-dev libmagickwand-dev
RUN pecl install xdebug
RUN pecl install imagick
RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql bcmath zip
RUN docker-php-ext-install -j$(nproc) zip
RUN docker-php-ext-install -j$(nproc) exif
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/lib/x86_64-linux-gnu/ --with-jpeg-dir=/usr/lib/x86_64-linux-gnu/
RUN docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-enable xdebug
RUN docker-php-ext-enable imagick
RUN rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- \
	--install-dir=/usr/local/bin \
	--filename=composer
