FROM httpd:2.4.63

# Install dependencies
RUN apt-get update -y && apt-get install -y \
    apache2-utils \
    libapache2-mod-security2 \
    modsecurity-crs \
    && rm -rf /var/lib/apt/lists/*

# Copy the ModSecurity module manually if missing
RUN test -f /usr/lib/apache2/modules/mod_security2.so && \
    cp /usr/lib/apache2/modules/mod_security2.so /usr/local/apache2/modules/ || \
    echo "WARNING: mod_security2.so not found"

# Enable ModSecurity module
RUN echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf

# Ensure logs directory exists
RUN mkdir -p /usr/local/apache2/logs \
    && touch /usr/local/apache2/logs/modsec_audit.log \
    && touch /usr/local/apache2/logs/modsec_debug.log \
    && chmod -R 755 /usr/local/apache2/logs

COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
