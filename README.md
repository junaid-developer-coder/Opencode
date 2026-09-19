<p align="center">
  <img src="assets/logo.svg" alt="OpenCode Setup" width="480">
</p>

<p align="center">
  <b>Install and configure <a href="https://opencode.ai">OpenCode</a> on Windows and Linux, the professional way.</b>
</p>

<p align="center">
  <a href="LICENSE"><img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-blue.svg"></a>
  <img alt="Platforms" src="https://img.shields.io/badge/platform-Windows%20%7C%20Linux%20%7C%20WSL-informational">
  <a href=".github/workflows/lint.yml"><img alt="lint" src="https://img.shields.io/badge/CI-lint-success"></a>
</p>

> **Disclaimer:** This is an unofficial, community repository. It is not affiliated with or endorsed by the OpenCode team. The logo in `assets/` is original artwork and is not the official OpenCode logo.

## Contents

- [What is OpenCode?](#what-is-opencode)
- [Requirements](#requirements)
- [Install on Linux](#install-on-linux)
- [Install on Windows](#install-on-windows)
- [Verify](#verify)
- [Connect a model provider](#connect-a-model-provider)
- [Project config](#project-config)
- [Update and uninstall](#update-and-uninstall)
- [Troubleshooting](#troubleshooting)
- [Repository layout](#repository-layout)
- [Contributing](#contributing)

## What is OpenCode?

OpenCode is an open-source AI coding agent. It runs as a terminal UI, a desktop app, or an IDE extension, and works with many LLM providers.

## Requirements

- A modern terminal emulator
- An API key for the LLM provider you want to use
- Optional: Node.js 18+ if you install through npm

## Install on Linux

**Option 1: Official script (simplest)**

```bash
curl -fsSL https://opencode.ai/install | bash
```

**Option 2: This repo's wrapper (checks for an existing install, falls back to npm)**

```bash
git clone https://github.com/<you>/opencode-setup.git
cd opencode-setup
./scripts/install.sh
```

**Option 3: Package managers**

```bash
npm install -g opencode-ai@latest        # any distro with Node.js
brew install anomalyco/tap/opencode      # Homebrew (recommended tap, latest version)
sudo pacman -S opencode                  # Arch Linux (stable)
paru -S opencode-bin                     # Arch Linux (AUR, latest)
mise use -g github:anomalyco/opencode    # mise
```

## Install on Windows

WSL is the smoothest experience. If you prefer native Windows, use one of these in PowerShell:

```powershell
scoop install opencode
choco install opencode        # run as Administrator
npm install -g opencode-ai@latest
```

Or run this repo's wrapper, which picks whichever tool you already have:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\install.ps1
```

**Using WSL (recommended):**

```powershell
wsl --install -d Ubuntu
```

Then open Ubuntu and follow [Install on Linux](#install-on-linux).

## Verify

```bash
opencode --version
```

Open a **new** terminal first if the command is not found, so your PATH refreshes.

## Connect a model provider

```bash
cd /path/to/your/project
opencode
```

Inside the TUI, run `/connect`, choose a provider, and paste your API key. Then use `/models` to pick a model.

## Project config

Add an `opencode.json` at your project root to share settings with your team. Keep secrets out of it and use environment variables instead. See the [official docs](https://opencode.ai/docs) for the current schema.

## Update and uninstall

| Method | Update | Remove |
| --- | --- | --- |
| Install script | re-run the script | delete the install directory and the PATH line the script added to your shell rc |
| npm | `npm i -g opencode-ai@latest` | `npm rm -g opencode-ai` |
| Scoop | `scoop update opencode` | `scoop uninstall opencode` |
| Chocolatey | `choco upgrade opencode` | `choco uninstall opencode` |
| Homebrew | `brew upgrade opencode` | `brew uninstall opencode` |

## Troubleshooting

- **"failed to install the right version for your platform" (npm on Linux/WSL):** install the matching platform package it names, for example `opencode-linux-x64`, `opencode-linux-x64-baseline`, or a `-musl` variant on Alpine.
- **`opencode: command not found`:** open a new shell, or check that the install directory is on your PATH.
- **PowerShell blocks the script:** run `Set-ExecutionPolicy -Scope Process Bypass` for that session only.


## Contributing

Issues and PRs are welcome. Please keep scripts idempotent, run `shellcheck` on shell changes, and never commit API keys.

## License

[MIT](LICENSE)
