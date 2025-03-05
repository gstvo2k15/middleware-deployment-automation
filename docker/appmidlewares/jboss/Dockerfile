FROM quay.io/wildfly/wildfly:26.1.1.Final

USER root

# Instalar herramientas esenciales
RUN yum install -y nano unzip firewalld iptables fail2ban && \
    yum clean all

# Crear usuario seguro para WildFly
RUN useradd -r -s /sbin/nologin wildfly && \
    chown -R wildfly:wildfly /opt/wildfly

# Generar un keystore automáticamente si no existe
RUN mkdir -p /etc/pki/tls/private && \
    if [ ! -f /etc/pki/tls/private/wildfly-keystore.jks ]; then \
        keytool -genkey -alias wildfly -keyalg RSA -keystore /etc/pki/tls/private/wildfly-keystore.jks \
        -storepass SuperSecurePass -keypass SuperSecurePass -validity 365 \
        -dname "CN=localhost, OU=DevOps, O=MyCompany, L=City, ST=State, C=US"; \
    fi

# Copiar configuración segura
COPY config/standalone.xml /opt/wildfly/standalone/configuration/
COPY scripts/ /scripts/
RUN chmod +x /scripts/*.sh

USER wildfly

CMD ["/scripts/entrypoint.sh"]
