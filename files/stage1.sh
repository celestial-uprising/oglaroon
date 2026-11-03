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
	alsa-lib-devel jack-audio-connection-kit-devel

curl -fsSL https://github.com/cargo-bins/cargo-binstall/releases/latest/download/cargo-binstall-x86_64-unknown-linux-musl.tgz | tar -xz -C /usr/bin cargo-binstall

cargo install --root /tmp  --git https://github.com/rezigned/upmd.git
cargo install --root /tmp  amdtop
cargo install --root /tmp  netop
cargo install --root /tmp  --locked --git https://github.com/pamburus/termframe.git
cargo install --root /tmp  terminal_gameboy

cargo binstall --root /tmp  wrkflw kmon treemd llmfit yazi-fm yazi-cli presenterm trippy viddy xan doxx diskonaut git-interactive-rebase-tool xleak bookokrat wiki-tui asak darya serie

GOBIN=/tmp/bin go install github.com/moezdil/siltide@latest
GOBIN=/tmp/bin go install github.com/ChausseBenjamin/termpicker@latest
GOBIN=/tmp/bin go install github.com/szktkfm/mdtt/cmd/mdtt@latest
GOBIN=/tmp/bin go install github.com/zyedidia/eget@latest
GOBIN=/tmp/bin go install github.com/Lifailon/lazyjournal@latest
GOBIN=/tmp/bin go install github.com/termkit/gama@latest
GOBIN=/tmp/bin go install github.com/jesseduffield/lazygit@latest
GOBIN=/tmp/bin go install github.com/charmbracelet/glow/v2@latest
GOBIN=/tmp/bin go install github.com/kencx/keyb@latest
GOBIN=/tmp/bin go install github.com/chojs23/ec/cmd/ec@latest
GOBIN=/tmp/bin go install github.com/fumiyas/qrc/cmd/qrc@latest
GOBIN=/tmp/bin go install github.com/ashish0kumar/stormy@latest
GOBIN=/tmp/bin go install github.com/maaslalani/sheets@main
GOBIN=/tmp/bin go install github.com/alvinunreal/lazyskills/cmd/lazyskills@latest
GOBIN=/tmp/bin go install github.com/wagoodman/dive@latest
