ARG APACHE_VERSION=2.4.57
FROM httpd:${APACHE_VERSION}

RUN apt-get update -yqq && apt-get install -yqq \
    libapache2-mod-security2 \
    modsecurity-crs \
    && rm -rf /var/lib/apt/lists/*

RUN a2enmod headers security2

COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443
CMD ["httpd-foreground"]
