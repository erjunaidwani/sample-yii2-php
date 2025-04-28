FROM php:8.1-apache

# Install necessary extensions
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd pdo pdo_mysql

# Set working directory
WORKDIR /var/www/html

# Copy project files into the container
COPY . .

# Expose port 80 to be accessed by NGINX
EXPOSE 80

# Enable apache mod_rewrite
RUN a2enmod rewrite

