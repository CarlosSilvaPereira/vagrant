#!/bin/bash

PENTAHO_VERSION=$1
PENTAHO_INSTALL_DIR=/home/vagrant/PentahoCE

echo "Provisioning Pentaho CE $PENTAHO_VERSION to $PENTAHO_INSTALL_DIR"

# create a standard pentaho installation folder layout
sudo -u vagrant mkdir -p /home/vagrant/Pentaho/design-tools
sudo -u vagrant mkdir -p /home/vagrant/Pentaho/server

# unzip the biserver and pdi to the correct folders
sudo -u vagrant unzip /shared-files/biserver-ce-$PENTAHO_VERSION.zip -d $PENTAHO_INSTALL_DIR/server > /dev/null
sudo -u vagrant unzip /shared-files/pdi-ce-$PENTAHO_VERSION.zip -d $PENTAHO_INSTALL_DIR/design-tools > /dev/null
