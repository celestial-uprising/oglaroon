#!/usr/bin/env bash
set -oue pipefail

mkdir -p /tmp/bin

dnf5 upgrade -y && dnf5 install -y \
	cargo rustc \
	golang pkg-config \
	make gcc-c++ \
	cmake tar gzip curl \
	libdrm-devel libpcap-devel \
	openssl-devel zlib-devel \
	alsa-lib-devel zig \
	jack-audio-connection-kit-devel \
	perl perl-FindBin gcc 

curl -fsSL https://github.com/cargo-bins/cargo-binstall/releases/latest/download/cargo-binstall-x86_64-unknown-linux-musl.tgz | tar -xz -C /usr/bin cargo-binstall

ingrid="cargo install --root /tmp"

$ingrid --git https://github.com/rezigned/upmd.git
$ingrid amdtop
$ingrid netop
$ingrid terminal_gameboy
$ingrid zellij
$ingrid asak

cargo binstall --root /tmp  wrkflw kmon treemd llmfit yazi-fm yazi-cli viddy xan doxx diskonaut xleak serie

raelynn="env GOBIN=/tmp/bin go install"

$raelynn github.com/moezdil/siltide@latest
$raelynn github.com/szktkfm/mdtt/cmd/mdtt@latest
$raelynn github.com/zyedidia/eget@latest
$raelynn github.com/Lifailon/lazyjournal@latest
$raelynn github.com/termkit/gama@latest
$raelynn github.com/jesseduffield/lazygit@latest
$raelynn github.com/charmbracelet/glow/v2@latest
$raelynn github.com/kencx/keyb@latest
$raelynn github.com/chojs23/ec/cmd/ec@latest
$raelynn github.com/fumiyas/qrc/cmd/qrc@latest
$raelynn github.com/alvinunreal/lazyskills/cmd/lazyskills@latest
$raelynn github.com/wagoodman/dive@latest
