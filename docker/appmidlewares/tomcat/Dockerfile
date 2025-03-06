FROM tomcat:9.0-jdk11-temurin

# Configuración de usuario tomcat con permisos correctos
RUN groupadd -r tomcat && useradd -r -g tomcat -d /usr/local/tomcat tomcat

# Crear directorios necesarios
RUN mkdir -p /usr/local/tomcat/conf /usr/local/tomcat/webapps && \
    chown -R tomcat:tomcat /usr/local/tomcat

# Agregar certificados auto-firmados
RUN openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 \
    -subj "/C=ES/ST=State/L=City/O=Company/OU=IT/CN=localhost" \
    -keyout /usr/local/tomcat/conf/tomcat-key.pem \
    -out /usr/local/tomcat/conf/tomcat-cert.pem

# Permisos adecuados
RUN chmod 600 /usr/local/tomcat/conf/tomcat-key.pem && \
    chmod 644 /usr/local/tomcat/conf/tomcat-cert.pem

# Cambiar usuario a tomcat
USER tomcat

# Exponer puertos
EXPOSE 8080 8443

# Comando de arranque
CMD ["catalina.sh", "run"]
