#!/usr/bin/env bash
set -oue pipefail

dnf install -y \
  gtk4-devel \
  protobuf-compiler \
  cairo-devel \
  poppler-glib-devel \
  pixman-devel \
  libmpv-devel

git clone https://github.com/abenz1267/elephant.git /tmp/elephant
cd /tmp/elephant
env GOBIN=/tmp/bin go build -o elephant cmd/elephant.go

git clone https://github.com/abenz1267/walker.git /tmp/walker
cd /tmp/walker
cargo build --release --root /tmp
