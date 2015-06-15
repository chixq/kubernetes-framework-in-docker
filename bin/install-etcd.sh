#!/usr/bin/env bash

set -e

ETCD_ARCHIVE_URL=${ETCD_ARCHIVE_URL:-https://github.com/coreos/etcd/releases/download/v2.0.11/etcd-v2.0.11-linux-amd64.tar.gz}
ETCD_ARCHIVE=/tmp/$(basename ${ETCD_ARCHIVE_URL})

echo "Downloading etcd (${ETCD_ARCHIVE_URL})..."
wget --no-check-certificate -nv $ETCD_ARCHIVE_URL -O $ETCD_ARCHIVE
echo "Installing etcd (/usr/local/bin/etcd)..."
mkdir -p /tmp/etcd
tar xf $ETCD_ARCHIVE -C /tmp/etcd
mv /tmp/etcd/*/etcd* /usr/local/bin/

rm -f $ETCD_ARCHIVE
