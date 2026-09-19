#!/usr/bin/env bash
# Linux / macOS / WSL installer wrapper for OpenCode.
set -euo pipefail

say() { printf '\033[1;36m==>\033[0m %s\n' "$*"; }
die() { printf '\033[1;31merror:\033[0m %s\n' "$*" >&2; exit 1; }

if command -v opencode >/dev/null 2>&1; then
  say "OpenCode already installed: $(opencode --version)"
  exit 0
fi

if command -v curl >/dev/null 2>&1; then
  say "Installing via the official install script"
  curl -fsSL https://opencode.ai/install | bash
elif command -v npm >/dev/null 2>&1; then
  say "curl not found, falling back to npm"
  npm install -g opencode-ai@latest
else
  die "Need curl or npm. Install one and re-run."
fi

command -v opencode >/dev/null 2>&1 || die "Installed, but 'opencode' is not on PATH. Open a new shell."
say "Done: $(opencode --version)"
