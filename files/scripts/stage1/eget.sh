#!/usr/bin/env bash
set -oue pipefail

curl https://zyedidia.github.io/eget.sh | sh

cd /tmp/bin

eget hanshuaikang/nping
eget timkicker/podliner
eget RivoLink/leaf
eget matthart1983/kernwatch
eget nasedkinpv/numr
eget wentbackward/nv-monitor
eget nektos/act
