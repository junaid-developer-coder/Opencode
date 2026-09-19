# Windows installer wrapper for OpenCode (PowerShell 5.1+ / 7+).
$ErrorActionPreference = 'Stop'

function Say($m) { Write-Host "==> $m" -ForegroundColor Cyan }

if (Get-Command opencode -ErrorAction SilentlyContinue) {
    Say "OpenCode already installed: $(opencode --version)"
    exit 0
}

if (Get-Command scoop -ErrorAction SilentlyContinue) {
    Say "Installing with Scoop"
    scoop install opencode
}
elseif (Get-Command choco -ErrorAction SilentlyContinue) {
    Say "Installing with Chocolatey (run as Administrator)"
    choco install opencode -y
}
elseif (Get-Command npm -ErrorAction SilentlyContinue) {
    Say "Installing with npm"
    npm install -g opencode-ai@latest
}
else {
    throw "Install Scoop, Chocolatey or Node.js first. WSL is also supported: see README."
}

Say "Done. Open a NEW terminal and run: opencode --version"
