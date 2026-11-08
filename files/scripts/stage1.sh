#!/usr/bin/env bash
set -oue pipefail

mkdir -p /tmp/bin

dnf5 upgrade -y && dnf5 install -y \
	cargo \
	rustc \
	golang \
	pkg-config \
	make \
	gcc-c++ \
	cmake \
	tar \
	gzip \
	curl \
	libpcap-devel \
	alsa-lib-devel \
	pipewire-jack-audio-connection-kit-devel

ingrid="cargo install --root /tmp"

$ingrid --git https://github.com/rezigned/upmd.git
$ingrid netop
$ingrid viddy
$ingrid serie
$ingrid wrkflw
$ingrid xan
$ingrid xleak
$ingrid doxx
$ingrid kmon
$ingrid xleak
$ingrid yazi-fm
$ingrid yazi-cli
$ingrid terminal_gameboy

raelynn="env GOBIN=/tmp/bin go install"

$raelynn github.com/moezdil/siltide@latest
$raelynn github.com/szktkfm/mdtt/cmd/mdtt@latest
$raelynn github.com/Lifailon/lazyjournal@latest
$raelynn github.com/termkit/gama@latest
$raelynn github.com/jesseduffield/lazygit@latest
$raelynn github.com/charmbracelet/glow/v2@latest
$raelynn github.com/kencx/keyb@latest
$raelynn github.com/chojs23/ec/cmd/ec@latest
$raelynn github.com/alvinunreal/lazyskills/cmd/lazyskills@latest
