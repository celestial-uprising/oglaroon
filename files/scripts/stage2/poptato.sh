#!/usr/bin/env bash
set -oue pipefail

dnf5 install -y \
	cargo \
	rustc \
	pkg-config \
	make \
	gcc \
	git \
	gtk4-devel \
	gtk4-layer-shell-devel

cargo install --root /tmp --git https://github.com/skorotkiewicz/poptato.git
