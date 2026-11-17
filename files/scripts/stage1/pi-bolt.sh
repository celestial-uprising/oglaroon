#!/usr/bin/env bash
set -euo pipefail

PIBOLT_VERSION="bolt-v1.2.1"
BUILD_BIN="/tmp/bin"
SKEL_DIR="/tmp/skel/.pi/agent"

mkdir -p "${BUILD_BIN}"
mkdir -p "${SKEL_DIR}/agents"
mkdir -p "${SKEL_DIR}/extensions"
mkdir -p "${SKEL_DIR}/skills"

echo "Downloading Pi-Bolt binary..."
curl -fsSL "https://github.com/opensec-git/Pi-Bolt/releases/download/${PIBOLT_VERSION}/pi-bolt-linux-x64-jit.tar.gz" -o /tmp/pi-bolt.tgz
mkdir -p /tmp/pi-extract
tar -xzf /tmp/pi-bolt.tgz -C /tmp/pi-extract --strip-components=1
cp /tmp/pi-extract/pi "${BUILD_BIN}/pi-bolt"
chmod +x "${BUILD_BIN}/pi-bolt"
rm -rf /tmp/pi-bolt.tgz /tmp/pi-extract

cat << 'EOF' > "${SKEL_DIR}/mcp.json"
{
  "mcpServers": {
    "rea-agents": {
      "command": "npx",
      "args": ["-y", "rea-agents"]
    }
  }
}
EOF

cat << 'EOF' > "${SKEL_DIR}/agents/reviewer.md"
---
name: reviewer
description: Read-only code reviewer that checks code safety and logic
tools: read, grep, find, ls
---
You are a strict code reviewer. Analyze requested files or git diffs and report bugs, security vulnerabilities, and edge cases concisely. Do not modify files.
EOF

SKEL_EXT_DIR="${SKEL_DIR}/extensions"
EXTENSIONS=(
    "billion-context"
    "pi-powerline-footer"
    "pi-open-tui"
    "pi-cache-optimizer"
    "pi-markdown-preview"
    "pi-web-access"
    "opensec-pi-subagents"
)

TEMP_DIR=$(mktemp -d)
cd "${TEMP_DIR}"

for ext in "${EXTENSIONS[@]}"; do
    echo "Pre-bundling extension: ${ext}..."
    npm pack "npm:${ext}" > /dev/null 2>&1 || {
        echo "Warning: Could not fetch ${ext}, skipping..."
        continue
    }
    
    mkdir -p "${SKEL_EXT_DIR}/${ext}"
    tar -xzf *.tgz -C "${SKEL_EXT_DIR}/${ext}" --strip-components=1
    rm -f *.tgz
    
    if [ -f "${SKEL_EXT_DIR}/${ext}/package.json" ]; then
        pushd "${SKEL_EXT_DIR}/${ext}" > /dev/null
        npm install --omit=dev --silent || {
            echo "Warning: Failed to npm install dependencies for ${ext}"
        }
        popd > /dev/null
    fi
done

find "${SKEL_EXT_DIR}" -type f \( \
    -name "*.ts" -o \
    -name "*.map" -o \
    -name "*.md" -o \
    -name "LICENSE*" -o \
    -name ".gitignore" -o \
    -name ".npmignore" \
) -delete

find "${SKEL_EXT_DIR}" -type d \( \
    -name "test" -o \
    -name "tests" -o \
    -name "__tests__" -o \
    -name ".git" -o \
    -name "docs" \
) -exec rm -rf {} + 2>/dev/null || true

rm -rf "${TEMP_DIR}"
npm cache clean --force
