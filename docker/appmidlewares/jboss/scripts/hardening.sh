#!/bin/bash
set -e

# Disable automatic deployments
sed -i 's/scan-enabled="true"/scan-enabled="false"/g' /opt/wildfly/standalone/configuration/standalone.xml

# Disable remoting JBoss
sed -i 's|<subsystem xmlns="urn:jboss:domain:remoting:5.0">|<subsystem xmlns="urn:jboss:domain:remoting:5.0" enabled="false">|g' /opt/wildfly/standalone/configuration/standalone.xml

# Config TLS
sed -i 's|<keystore path=.*|<keystore path="/etc/pki/tls/private/wildfly-keystore.jks" keystore-password="SuperSecurePass"/>|g' /opt/wildfly/standalone/configuration/standalone.xml

# Generate Keystore in runtime if not exist
if [ ! -f /etc/pki/tls/private/wildfly-keystore.jks ]
    then
        echo "🔑 Generando keystore para TLS..."
        keytool -genkey -alias wildfly -keyalg RSA -keystore /etc/pki/tls/private/wildfly-keystore.jks \
            -storepass SuperSecurePass -keypass SuperSecurePass -validity 365 \
            -dname "CN=localhost, OU=DevOps, O=MyCompany, L=City, ST=State, C=US"
fi
