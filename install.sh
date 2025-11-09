#!/usr/bin/env bash

# DevKit installer
set -e  # Exit immediately if a command exits with a non-zero status

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if claude is installed
if command -v claude >/dev/null 2>&1; then
    echo "✅ claude is already installed"
    echo "   Location: $(command -v claude)"
    echo "   Version: $(claude --version 2>&1 | head -n1)"
else
    echo "⚙️ claude not found. Installing..."
    curl -fsSL https://claude.ai/install.sh | bash
    # Need to reload PATH to pick up ~/.local/bin
    export PATH="$HOME/.local/bin:$PATH"
    if command -v claude >/dev/null 2>&1; then
        echo "✅ claude installed successfully at: $(command -v claude)"
    else
        echo "❌ Installation failed. Please check your internet connection or permissions."
        echo "Note: You may need to restart your shell or run: export PATH=\"\$HOME/.local/bin:\$PATH\""
        exit 1
    fi
fi


# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
echo "→ Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ./homebrew/homebrew.sh
echo "✅ Homebrew installed successfully"
else
echo "✅ Homebrew already installed"
echo "   Location: $(command -v brew)"
echo "   Version: $(brew --version | head -n1)"
fi


