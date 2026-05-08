#!/usr/bin/env bash
set -euo pipefail

VERSION="${1:?Usage: $0 <version>}"
VERSION="${VERSION#v}"

BASE_URL="https://github.com/localopsco/lops-cli/releases/download/v${VERSION}"
FORMULA="Formula/ops.rb"
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

echo "Downloading assets for v${VERSION}..."
for asset in ops-darwin-arm64.tar.gz ops-darwin-amd64.tar.gz ops-linux-amd64.tar.gz ops-linux-arm64.tar.gz; do
  curl -fsSL -o "${TMPDIR}/${asset}" "${BASE_URL}/${asset}"
done

echo "Computing checksums..."
SHA_DARWIN_ARM64=$(sha256sum "${TMPDIR}/ops-darwin-arm64.tar.gz" | cut -d' ' -f1)
SHA_DARWIN_AMD64=$(sha256sum "${TMPDIR}/ops-darwin-amd64.tar.gz" | cut -d' ' -f1)
SHA_LINUX_ARM64=$(sha256sum "${TMPDIR}/ops-linux-arm64.tar.gz" | cut -d' ' -f1)
SHA_LINUX_AMD64=$(sha256sum "${TMPDIR}/ops-linux-amd64.tar.gz" | cut -d' ' -f1)

echo "Updating ${FORMULA}..."
# Update version
sed -i "s/version \".*\"/version \"${VERSION}\"/" "$FORMULA"
# Update download URLs
sed -i "s|/download/v[^/]*/|/download/v${VERSION}/|g" "$FORMULA"
# Update checksums (order: darwin-arm64, darwin-amd64, linux-arm64, linux-amd64)
awk -v s1="$SHA_DARWIN_ARM64" -v s2="$SHA_DARWIN_AMD64" -v s3="$SHA_LINUX_ARM64" -v s4="$SHA_LINUX_AMD64" '
  /sha256/ { n++; if(n==1) sub(/"[a-f0-9]+"/, "\""s1"\""); if(n==2) sub(/"[a-f0-9]+"/, "\""s2"\""); if(n==3) sub(/"[a-f0-9]+"/, "\""s3"\""); if(n==4) sub(/"[a-f0-9]+"/, "\""s4"\"") }
  { print }
' "$FORMULA" > "${FORMULA}.tmp" && mv "${FORMULA}.tmp" "$FORMULA"

echo "Updated to v${VERSION}"
