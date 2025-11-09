# DevKit

A powerful developer environment toolkit that streamlines your development workflow with unified tool management, smart aliases, and environment configuration.

## What is DevKit?

DevKit is a comprehensive shell environment manager that provides:

- **Unified Tool Management** - Automatic version management for Node.js, Python, Kubernetes tools, and more via [mise](https://mise.jdx.dev/)
- **Smart Aliases** - Organized command shortcuts categorized by function (Kubernetes, DevKit, general shortcuts)
- **Environment Configuration** - Automatic loading of environment variables from `.env` files
- **Shell Integration** - Seamless integration with Zsh and Bash shells
- **Developer Tools** - Pre-configured setup for Claude Code, Docker, and common CLI utilities

## Prerequisites

- macOS 
- Zsh shell (default on modern macOS)

## Installation

### 1. Clone the Repository

```bash
git clone <repository-url> devkit
cd devkit
```

### 2. Run the Installation Script

```bash
./install.sh
```

This script will install:
- Homebrew (if not already installed)
- mise (unified version manager)
- System utilities (unzip, zsh-syntax-highlighting, thefuck)
- Docker and Docker completion
- Development tools from `mise/mise.toml`:
  - Node.js, pnpm
  - Python, uv
  - kubectl, kustomize, kind
  - jq, yq, gh, usage
- Claude Code CLI

### 3. Configure Your Shell

Add the following lines to your `~/.zprofile`:

```bash
export DEVKIT_DIR=<PATH_TO_DEVKIT>
source ${DEVKIT_DIR}/devkit.sh
```

### 4. Reload Your Shell

```bash
source ~/.zprofile
```

You should see the DevKit banner and a success message!

## Usage

### View Available Aliases

Run the following command to see all available DevKit aliases organized by category:

```bash
devkit-aliases
```

### Environment Variables

DevKit automatically loads environment variables from `${DEVKIT_DIR}/.env` if the file exists. Create this file to store your environment-specific configuration:

```bash
# Example .env file
export MY_API_KEY="your-api-key"
export MY_SERVICE_URL="https://example.com"
```

### Tool Version Management

DevKit uses mise to manage tool versions. To modify which tools are available:

1. Edit `mise/mise.toml`
2. Run `mise install` to install new tools
3. Reload your shell

## Customization

### Adding Your Own Aliases

Edit `shell/alias/alias.sh` to add custom aliases:

```bash
## 🎨 Your Category Name
alias myalias="your command here"
```

### Adding Shell Functions

Add custom functions to `shell/functions/devkit-aliases.sh` or create new function files and source them in `devkit.sh`.