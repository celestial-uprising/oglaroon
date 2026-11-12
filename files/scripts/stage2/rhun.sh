#!/usr/bin/env bash
set -euo pipefail

dnf5 install -y \
	wget

cd /tmp

VERSION=$(curl -fsSL "https://github.com/vshvedov/rhun/releases/latest/download/VERSION" | tr -d ' \r\n')
wget https://github.com/vshvedov/rhun/releases/download/v${VERSION}/rhun-${VERSION}-linux-x86_64.tar.gz -O /tmp/rhun.tar.gz

tar -xz /tmp/rhun.tar.gz
mv /tmp/rhun-${VERSION} /tmp/rhun
mv /tmp/rhun/bin/rhun /tmp/bin
chmod +x /tmp/bin/rhun
