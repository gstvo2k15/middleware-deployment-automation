FROM httpd:2.4.63

# Install dependencies
RUN apt-get update -y && apt-get install -y \
    apache2-utils \
    libapache2-mod-security2 \
    modsecurity-crs \
    && rm -rf /var/lib/apt/lists/*

# Ensure ModSecurity logs directory exists and has correct permissions
RUN mkdir -p /var/log/apache2 && \
    touch /var/log/apache2/modsec_audit.log && \
    touch /var/log/apache2/modsec_debug.log && \
    chmod -R 755 /var/log/apache2

# Enable ModSecurity module
RUN echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf

# Copy configuration files
COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
