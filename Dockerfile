# Use the latest WordPress image with Apache
FROM wordpress:latest

# Install additional packages
RUN apt-get update && apt-get install -y magic-wormhole

# Configure PHP settings
RUN { \
    echo 'upload_max_filesize = 64M'; \
    echo 'post_max_size = 64M'; \
    echo 'memory_limit = 256M'; \
} > /usr/local/etc/php/conf.d/custom.ini

# Change the default shell for the www-data user to bash
RUN usermod -s /bin/bash www-data

# Change ownership of the /var/www directory to www-data user
RUN chown www-data:www-data /var/www

# Switch to www-data user
USER www-data:www-data
