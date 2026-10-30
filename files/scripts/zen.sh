#!/usr/bin/env bash
set -euo pipefail
TAR="zen.linux-x86_64.tar.xz"
TARBALL="https://github.com/zen-browser/desktop/releases/download/1.24b/$TAR"
DIR="/tmp"
cd "$DIR"
wget "$TARBALL"
tar xf "$TAR"
cp -r zen /opt/
rm -rf /tmp/*
