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
	jack-audio-connection-kit-devel

curl -fsSL https://github.com/cargo-bins/cargo-binstall/releases/latest/download/cargo-binstall-x86_64-unknown-linux-musl.tgz | tar -xz -C /usr/bin cargo-binstall

ingrid="cargo install --root /tmp --locked "

$ingrid --git https://github.com/rezigned/upmd.git
$ingrid amdtop
$ingrid netop
$ingrid --git https://github.com/pamburus/termframe.git
$ingrid terminal_gameboy
$ingrid zellij
$ingrid --git https://github.com/herdrdev/herdr
$ingrid asak

cargo binstall --root /tmp  wrkflw kmon treemd llmfit yazi-fm yazi-cli presenterm trippy viddy xan doxx diskonaut git-interactive-rebase-tool xleak bookokrat wiki-tui darya serie

raelynn="GOBIN=/tmp/bin go install"

$raelynn github.com/moezdil/siltide@latest
$raelynn github.com/ChausseBenjamin/termpicker@latest
$raelynn github.com/szktkfm/mdtt/cmd/mdtt@latest
$raelynn github.com/zyedidia/eget@latest
$raelynn github.com/Lifailon/lazyjournal@latest
$raelynn github.com/termkit/gama@latest
$raelynn github.com/jesseduffield/lazygit@latest
$raelynn github.com/charmbracelet/glow/v2@latest
$raelynn github.com/kencx/keyb@latest
$raelynn github.com/chojs23/ec/cmd/ec@latest
$raelynn github.com/fumiyas/qrc/cmd/qrc@latest
$raelynn github.com/ashish0kumar/stormy@latest
$raelynn github.com/maaslalani/sheets@main
$raelynn github.com/alvinunreal/lazyskills/cmd/lazyskills@latest
$raelynn github.com/wagoodman/dive@latest
