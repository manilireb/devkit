#!/usr/bin/env bash

# DevKit installer
set -e  # Exit immediately if a command exits with a non-zero status

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if claude is installed
if command -v claude >/dev/null 2>&1; then
    echo "✅ claude is already installed at: $(command -v claude)"
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

# Setup DevKit in shell configuration
echo ""
echo "⚙️ Setting up DevKit..."

# Determine which shell config file to use
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    SHELL_CONFIG="$HOME/.bash_profile"
fi

echo "📝 Using shell configuration file: $SHELL_CONFIG"

# Check if DevKit is already configured
if grep -q "# DevKit Configuration" "$SHELL_CONFIG" 2>/dev/null; then
    echo "✅ DevKit is already configured in $SHELL_CONFIG"
else
    echo "📝 Adding DevKit configuration to $SHELL_CONFIG"

    cat >> "$SHELL_CONFIG" << EOF

# ============================================================================
# DevKit Configuration
# ============================================================================
export DEVKIT_DIR="$SCRIPT_DIR"

# Source DevKit components
source "\$DEVKIT_DIR/devkit.sh"
source "\$DEVKIT_DIR/shell/alias/alias.sh"
source "\$DEVKIT_DIR/shell/functions/devkit-aliases.sh"
# ============================================================================
EOF

    echo "✅ DevKit configuration added successfully"
fi

echo ""
echo "🎉 Installation complete!"
echo ""
echo "To start using DevKit, either:"
echo "  1. Run: source $SHELL_CONFIG"
echo "  2. Or restart your terminal"
echo ""
echo "Then run 'devkit-aliases' to see all available commands"
echo ""

