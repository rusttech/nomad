#!/bin/bash

set -e

VAULT_VERSION="0.6.4"
CURDIR=`pwd`

if [[ $(vault version | cut -d ' ' -f 2) == "v$VAULT_VERSION" ]]; then
    echo "Vault v$VAULT_VERSION already installed; Skipping"
    exit
fi

echo Fetching Vault ${VAULT_VERSION}...
cd /tmp/
wget -q https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -O vault.zip
echo Installing Vault...
unzip vault.zip
sudo chmod +x vault
sudo mv vault /usr/bin/vault
cd ${CURDIR}
