FROM oraclelinux:8

# Evitar correr como root
RUN groupadd -r weblogic && useradd -r -g weblogic weblogic

# Instalar dependencias mínimas
RUN dnf install -y java-17-openjdk && dnf clean all

# Crear directorios de configuración
RUN mkdir -p /u01/oracle/user_projects/domains/mydomain \
    && mkdir -p /config \
    && mkdir -p /u01/oracle/certs

# Establecer permisos mínimos
RUN chown -R weblogic:weblogic /u01/oracle /config

# Copiar configuración de seguridad
COPY --chown=weblogic:weblogic volumes/config /config
COPY --chown=weblogic:weblogic volumes/certs /u01/oracle/certs

# Definir usuario no root
USER weblogic

# Configurar entrada de WebLogic
CMD ["/bin/bash", "/u01/oracle/container-scripts/startWebLogic.sh"]
