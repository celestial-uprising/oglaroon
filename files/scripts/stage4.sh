#!/usr/bin/env bash
set -oue pipefail

mkdir -p /tmp/bin

dnf5 upgrade -y && dnf5 install -y \
	gtk4-devel \
	openssl-devel \
	cargo \
	rustc \
	git \
	gtk4-layer-shell-devel \
	dbus-devel \
	sqlite-devel \
	librsvg2-devel \
	gdk-pixbuf2-devel

cargo install --root /tmp --git https://github.com/skxxtz/sherlock.git
