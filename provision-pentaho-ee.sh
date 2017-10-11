#!/bin/bash

PENTAHO_VERSION=$1
PENTAHO_INSTALL_DIR=/home/vagrant/PentahoEE

echo "Provisioning Pentaho EE $PENTAHO_VERSION to $PENTAHO_INSTALL_DIR"

# execute the install script in unnatended mode
chmod +x /shared-files/pentaho-business-analytics-$PENTAHO_VERSION-x64.bin
cd /shared-files/
./pentaho-business-analytics-$PENTAHO_VERSION-x64.bin --mode unattended --postgres_password root --prefix $PENTAHO_INSTALL_DIR
