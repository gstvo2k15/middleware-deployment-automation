FROM tomcat:9.0-jdk11-temurin

# Crear usuario sin privilegios
RUN groupadd -r tomcat && useradd -r -g tomcat -d /usr/local/tomcat tomcat

# Crear directorio si no existe y generar claves TLS
RUN mkdir -p /usr/local/tomcat/conf && \
    if [ ! -f /usr/local/tomcat/conf/tomcat-key.pem ]; then \
      openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 \
      -subj "/C=ES/ST=State/L=City/O=Company/OU=IT/CN=localhost" \
      -keyout /usr/local/tomcat/conf/tomcat-key.pem \
      -out /usr/local/tomcat/conf/tomcat-cert.pem; \
    fi

# Asignar permisos adecuados
RUN chown -R tomcat:tomcat /usr/local/tomcat/conf && \
    chmod 600 /usr/local/tomcat/conf/tomcat-key.pem && \
    chmod 644 /usr/local/tomcat/conf/tomcat-cert.pem

# Definir usuario sin privilegios
USER tomcat

# Exponer puertos
EXPOSE 8080 8443

# Comando de arranque
CMD ["catalina.sh", "run"]
