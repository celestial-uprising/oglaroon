#!/usr/bin/env bash
set -oue pipefail

dnf5 install -y \
	wget

wget https://corgi.computer/releases/20261106T233845Z-03c72b717526/corgi-linux-x86_64 -O /tmp/bin/corgi
chmod +x /tmp/bin/corgi
