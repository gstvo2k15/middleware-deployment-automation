#!/bin/sh
if [ "$ENABLE_SSL" = "true" ]; then
    echo "🔐 SSL is enabled. Checking certificates..."
    if [ ! -f "/etc/apache2/ssl/server.crt" ] || [ ! -f "/etc/apache2/ssl/server.key" ]; then
        echo "⚠️ No SSL certificates found. Generating self-signed certificates..."
        openssl req -x509 -newkey rsa:2048 -keyout /etc/apache2/ssl/server.key -out /etc/apache2/ssl/server.crt -days 365 -nodes -subj "/CN=localhost"
    fi
    echo "✅ SSL setup complete."
else
    echo "⚠️ SSL is disabled. Running Apache in HTTP mode."
fi
