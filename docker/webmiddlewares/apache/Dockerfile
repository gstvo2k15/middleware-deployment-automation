ARG APACHE_VERSION=2.4.57
FROM httpd:${APACHE_VERSION}

RUN apt-get update -yqq && apt-get install -yqq \
    apache2-utils \
    libapache2-mod-security2 \
    modsecurity-crs \
    && rm -rf /var/lib/apt/lists/*

RUN cp /usr/lib/apache2/modules/mod_security2.so /usr/local/apache2/modules/

RUN echo "LoadModule headers_module modules/mod_headers.so" >> /usr/local/apache2/conf/httpd.conf \
    && echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf

RUN mkdir -p /var/log/apache2 \
    && touch /var/log/apache2/modsec_audit.log /var/log/apache2/modsec_debug.log \
    && chmod -R 755 /var/log/apache2

COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
