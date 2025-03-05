FROM httpd:2.4.63

# Install necessary packages
RUN apt-get update && apt-get install -y \
    apache2-utils \
    libapache2-mod-security2 \
    && rm -rf /var/lib/apt/lists/*

# Ensure ModSecurity module is available
RUN if [ ! -f /usr/lib/apache2/modules/mod_security2.so ]; then \
        echo "ERROR: ModSecurity module is missing!"; \
        exit 1; \
    fi

# Copy the ModSecurity module to the correct location
RUN cp /usr/lib/apache2/modules/mod_security2.so /usr/local/apache2/modules/

# Enable the ModSecurity module
RUN echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf

# Create log directory for ModSecurity
RUN mkdir -p /var/log/apache2 && \
    touch /var/log/apache2/modsec_audit.log /var/log/apache2/modsec_debug.log && \
    chmod -R 777 /var/log/apache2

# Copy Apache and ModSecurity configuration
COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
