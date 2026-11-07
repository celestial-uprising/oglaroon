#!/usr/bin/env bash
set -oue pipefail
mkdir -p /tmp/bin
dnf5 install -y \
    cargo \
    rustc \
    git \
    gcc \
    pkgconf-pkg-config \
    gtk4-devel \
    gtk4-layer-shell-devel \
    glib2-devel \
    cairo-devel \
    gdk-pixbuf2-devel \
    dbus-devel \
    libinput-devel \
    libevdev-devel \
    pulseaudio-libs-devel
cargo install --root /tmp ironbar
