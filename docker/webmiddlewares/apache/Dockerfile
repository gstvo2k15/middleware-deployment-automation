ARG APACHE_VERSION=2.4.57
FROM httpd:${APACHE_VERSION}

RUN apt-get update -yqq && apt-get install -yqq \
    libapache2-mod-security2 \
    modsecurity-crs \
    && rm -rf /var/lib/apt/lists/*

RUN cp /usr/lib/apache2/modules/mod_security2.so /usr/local/apache2/modules/

RUN echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf \
    && echo "LoadModule headers_module modules/mod_headers.so" >> /usr/local/apache2/conf/httpd.conf

COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
