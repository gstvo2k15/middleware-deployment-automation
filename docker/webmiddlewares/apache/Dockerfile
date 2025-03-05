ARG APACHE_VERSION

FROM httpd:${APACHE_VERSION}-alpine3.21

# Installs ModSecurity and required utilities
RUN apk add --no-cache \
    apache2-utils \
    modsecurity-apache \
    modsecurity-crs

# ModSecurity Config
RUN cp /etc/modsecurity/modsecurity.conf-recommended /etc/modsecurity/modsecurity.conf \
    && sed -i 's/SecRuleEngine DetectionOnly/SecRuleEngine On/' /etc/modsecurity/modsecurity.conf

RUN echo "LoadModule headers_module modules/mod_headers.so" >> /usr/local/apache2/conf/httpd.conf \
    && echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf

# Logs Config
RUN mkdir -p /usr/local/apache2/logs \
    && touch /usr/local/apache2/logs/access.log \
    && touch /usr/local/apache2/logs/error.log \
    && touch /usr/local/apache2/logs/modsec_audit.log \
    && touch /usr/local/apache2/logs/modsec_debug.log \
    && chmod -R 755 /usr/local/apache2/logs

COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
