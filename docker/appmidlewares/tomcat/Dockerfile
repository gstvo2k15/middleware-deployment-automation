FROM tomcat:9.0-jdk11-temurin

# Crear usuario sin privilegios
RUN groupadd -r tomcat && useradd -r -g tomcat -d /usr/local/tomcat tomcat

# Generar keystore dentro del contenedor si no existe
RUN if [ ! -f /usr/local/tomcat/conf/keystore.jks ]; then \
      keytool -genkey -alias tomcat -keyalg RSA -keystore /usr/local/tomcat/conf/keystore.jks \
      -storepass changeme -keypass changeme -validity 3650 -keysize 4096 \
      -dname "CN=localhost, OU=Security, O=Company, L=City, S=State, C=US"; \
    fi

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
