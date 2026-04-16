#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.."; pwd)"
export PATH="$ROOT/.tools/mdbook/bin:$PATH"

cd "$ROOT"
mdbook serve --open