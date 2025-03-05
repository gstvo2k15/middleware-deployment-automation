ARG APACHE_VERSION=2.4.57
FROM httpd:${APACHE_VERSION}

RUN apt-get update && apt-get install -y \
    libapache2-mod-security2 \
    modsecurity-crs \
    && rm -rf /var/lib/apt/lists/*

# Enable ModSecurity
RUN a2enmod security2 \
    && cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf \
    && sed -i 's/SecRuleEngine DetectionOnly/SecRuleEngine On/' /etc/modsecurity/modsecurity.conf

# Copy Configs
COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
