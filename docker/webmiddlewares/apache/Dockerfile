FROM httpd:2.4.57-bullseye

# Install ModSecurity and dependencies
RUN apt-get update && apt-get install -y \
    libapache2-mod-security2 gettext-base \
    && rm -rf /var/lib/apt/lists/*

RUN test -f /usr/lib/apache2/modules/mod_security2.so && \
    cp /usr/lib/apache2/modules/mod_security2.so /usr/local/apache2/modules/ || \
    echo "ERROR: ModSecurity module not found!"

# Create logs for ModSecurity
RUN mkdir -p /var/log/apache2 && \
    touch /var/log/apache2/modsec_audit.log /var/log/apache2/modsec_debug.log && \
    chmod -R 775 /var/log/apache2

RUN echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf

# Copy template instead of actual httpd.conf
COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf.template
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

# Copy the template to a writable location before starting Apache
ENTRYPOINT ["/bin/sh", "-c", "cp /usr/local/apache2/conf/httpd.conf.template /tmp/httpd.conf && envsubst '$$SERVER_NAME' < /tmp/httpd.conf > /usr/local/apache2/conf/httpd.conf && exec httpd-foreground"]
