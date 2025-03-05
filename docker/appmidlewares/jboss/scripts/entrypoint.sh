#!/bin/bash
set -e

# Apply specific config before start WildFly
/scripts/hardening.sh

echo "Arrancando WildFly con seguridad aplicada..."
exec /opt/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement=127.0.0.1
