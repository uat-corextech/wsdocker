FROM php:8.2-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Enable Apache rewrite module (optional, good practice)
RUN a2enmod rewrite

# Copy website files
COPY . /var/www/html/

