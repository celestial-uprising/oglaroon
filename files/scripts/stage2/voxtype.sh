#!/usr/bin/env bash
set -oue pipefail

dnf5 install -y \
	cargo \
	rustc \
	pkg-config \
	cmake \
	libpcap-devel \
	alsa-lib-devel \
	clang-devel \
	git

cargo install --release --features gpu-vulkan,osd-native --root /tmp --git https://github.com/peteonrails/voxtype
