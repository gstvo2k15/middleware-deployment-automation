FROM quay.io/wildfly/wildfly:26.1.1.Final

USER root

# Instalar herramientas esenciales
RUN yum install -y nano unzip firewalld iptables fail2ban && \
    yum clean all

# Crear usuario seguro para WildFly
RUN useradd -r -s /sbin/nologin wildfly && \
    chown -R wildfly:wildfly /opt/wildfly

# Copiar configuración segura
COPY config/standalone.xml /opt/wildfly/standalone/configuration/
COPY certs/wildfly-keystore.jks /etc/pki/tls/private/
COPY scripts/ /scripts/
RUN chmod +x /scripts/*.sh

USER wildfly

CMD ["/scripts/entrypoint.sh"]
