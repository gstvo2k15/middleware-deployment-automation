#!/bin/bash
set -e

echo "Aplicando medidas de seguridad..."

# Disable automatic deployments
sed -i 's/scan-enabled="true"/scan-enabled="false"/g' /opt/wildfly/standalone/configuration/standalone.xml

# Disable remoting JBoss
sed -i 's|<subsystem xmlns="urn:jboss:domain:remoting:5.0">|<subsystem xmlns="urn:jboss:domain:remoting:5.0" enabled="false">|g' /opt/wildfly/standalone/configuration/standalone.xml

# Config TLS
sed -i 's|<keystore path=.*|<keystore path="/etc/pki/tls/private/wildfly-keystore.jks" keystore-password="SuperSecurePass"/>|g' /opt/wildfly/standalone/configuration/standalone.xml

echo "Hardening completado."
