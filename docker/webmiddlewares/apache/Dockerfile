FROM httpd:2.4.63-alpine3.21

# Install required packages, including ModSecurity
RUN apk add --no-cache \
    apache2-utils \
    curl \
    libxml2-dev \
    pcre-dev \
    modsecurity-apache \
    modsecurity-crs

# Enable ModSecurity modules in Apache
RUN echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf \
    && echo "LoadModule unique_id_module modules/mod_unique_id.so" >> /usr/local/apache2/conf/httpd.conf

# Ensure correct permissions for logs and configs
RUN mkdir -p /usr/local/apache2/logs \
    && touch /usr/local/apache2/logs/modsec_audit.log \
    && touch /usr/local/apache2/logs/modsec_debug.log \
    && chmod -R 755 /usr/local/apache2/logs

# Copy configuration files
COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
