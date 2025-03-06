FROM tomcat:9.0-jdk11-temurin

# Crear usuario sin privilegios
RUN groupadd -r tomcat && useradd -r -g tomcat -d /usr/local/tomcat tomcat

# Ajustar permisos
RUN chown -R tomcat:tomcat /usr/local/tomcat/conf \
    && chmod 600 /usr/local/tomcat/conf/tomcat-key.pem \
    && chmod 644 /usr/local/tomcat/conf/tomcat-cert.pem

# Ajustar permisos
RUN chown -R tomcat:tomcat /usr/local/tomcat \
    && chmod -R 750 /usr/local/tomcat/conf \
    && chmod 640 /usr/local/tomcat/conf/keystore.jks

# Definir usuario sin privilegios
USER tomcat

# Exponer puertos
EXPOSE 8080 8443

# Comando de arranque
CMD ["catalina.sh", "run"]
