ARG APACHE_VERSION=2.4.57
FROM httpd:${APACHE_VERSION}

LABEL maintainer="Gustavo Olmo <gustavo.olmo@es.abb.com>"

COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/
COPY config/logrotate.conf /etc/logrotate.d/apache2

RUN mkdir -p /usr/local/apache2/logs /usr/local/apache2/htdocs && \
    chmod -R 755 /usr/local/apache2/logs /usr/local/apache2/htdocs

EXPOSE 80 443

CMD ["httpd-foreground"]
