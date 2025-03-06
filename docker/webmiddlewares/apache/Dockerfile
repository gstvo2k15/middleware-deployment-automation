FROM httpd:2.4.57-bullseye

# Instalar ModSecurity y Certbot
RUN apt-get update && apt-get install -y \
    libapache2-mod-security2 \
    certbot \
    && rm -rf /var/lib/apt/lists/*

# Copiar el módulo de seguridad a la ruta de Apache
RUN test -f /usr/lib/apache2/modules/mod_security2.so && \
    cp /usr/lib/apache2/modules/mod_security2.so /usr/local/apache2/modules/ || \
    echo "ERROR: ModSecurity module not found!"

# Crear directorios para logs y certificados
RUN mkdir -p /var/log/apache2 /etc/apache2/ssl && \
    touch /var/log/apache2/modsec_audit.log /var/log/apache2/modsec_debug.log && \
    chmod -R 775 /var/log/apache2 /etc/apache2/ssl

# Cargar ModSecurity en Apache
RUN echo "LoadModule security2_module modules/mod_security2.so" >> /usr/local/apache2/conf/httpd.conf

# Copiar configuración de Apache
COPY config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY config/extra/ /usr/local/apache2/conf/extra/

# Generar certificados autofirmados si no existen
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=MiEmpresa/CN=apache.local"

# Configurar Apache para utilizar SSL
RUN echo "SSLCertificateFile /etc/apache2/ssl/apache.crt" >> /usr/local/apache2/conf/extra/ssl.conf && \
    echo "SSLCertificateKeyFile /etc/apache2/ssl/apache.key" >> /usr/local/apache2/conf/extra/ssl.conf

EXPOSE 80 443

CMD ["httpd-foreground"]
