ARG APACHE_VERSION
FROM httpd:${APACHE_VERSION}-alpine3.21

RUN apk add --no-cache \
    apache2-utils \
    curl \
    git \
    libxml2-dev \
    pcre-dev \
    libtool \
    automake \
    autoconf \
    gcc \
    g++ \
    make

RUN git clone --depth=1 https://github.com/SpiderLabs/ModSecurity /usr/local/src/ModSecurity \
    && cd /usr/local/src/ModSecurity \
    && ./build.sh \
    && ./configure \
    && make -j$(nproc) \
    && make install

RUN git clone --depth=1 https://github.com/SpiderLabs/ModSecurity-apache /usr/local/src/ModSecurity-apache \
    && cd /usr/local/src/ModSecurity-apache \
    && ./autogen.sh \
    && ./configure --with-apxs=/usr/local/apache2/bin/apxs \
    && make -j$(nproc) \
    && make install

RUN git clone --depth=1 https://github.com/coreruleset/coreruleset /usr/local/apache2/conf/crs \
    && cp /usr/local/apache2/conf/crs/crs-setup.conf.example /usr/local/apache2/conf/crs/crs-setup.conf

RUN echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf \
    && echo "Include conf/crs/crs-setup.conf" >> /usr/local/apache2/conf/httpd.conf \
    && echo "Include conf/crs/rules/*.conf" >> /usr/local/apache2/conf/httpd.conf

RUN mkdir -p /var/log/apache2 \
    && touch /var/log/apache2/modsec_audit.log /var/log/apache2/modsec_debug.log \
    && chmod -R 755 /var/log/apache2

COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

EXPOSE 80 443

CMD ["httpd-foreground"]
