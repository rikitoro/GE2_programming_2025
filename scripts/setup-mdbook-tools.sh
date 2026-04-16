#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.."; pwd)"
TOOLROOT="$ROOT/.tools/mdbook"

mkdir -p "$TOOLROOT"
cargo install --root "$TOOLROOT" mdbook --vers "0.4.52" --locked
cargo install --root "$TOOLROOT" mdbook-codename --vers "0.0.1" --locked
cargo install --root "$TOOLROOT" mdbook-pagetoc --vers "0.2.2" --locked
cargo install --root "$TOOLROOT" mdbook-admonish --vers "1.19.0" --locked