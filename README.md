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

- macOS (Darwin-based)
- Zsh shell (default on modern macOS)
- Internet connection for initial setup

## Installation

### 1. Clone the Repository

```bash
cd ~/Workzone
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
export DEVKIT_DIR=~/Workzone/devkit
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

### Built-in Aliases

DevKit provides several categories of aliases:

#### General DevKit Aliases
- `devkit` - Navigate to the DevKit directory
- `devkit-install` - Run the installation script
- `devkit-update` - Update DevKit configuration

#### Shortcuts
- `copypath` - Copy current directory path to clipboard
- `finder` - Open current directory in Finder

#### Kubernetes
- `k` - Shortcut for `kubectl`

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

Use `##` with an emoji to create new categories. The `devkit-aliases` function will automatically parse and display them.

### Adding Shell Functions

Add custom functions to `shell/functions/devkit-aliases.sh` or create new function files and source them in `devkit.sh`.

## Project Structure

```
devkit/
├── devkit.sh                      # Main entry point
├── install.sh                     # Installation script
├── mise/
│   └── mise.toml                  # Tool version definitions
├── shell/
│   ├── alias/
│   │   └── alias.sh              # Alias definitions
│   └── functions/
│       └── devkit-aliases.sh     # Shell functions
├── apps/
│   └── claude-code/
│       └── claude-code.sh        # Claude Code integration
└── .env                          # Environment variables (create as needed)
```

## Features in Detail

### ASCII Art Banner

Every time you start a new shell session, DevKit greets you with a stylish ASCII art banner and a personalized welcome message.

### Automatic Environment Loading

DevKit automatically:
1. Loads environment variables from `.env`
2. Configures and activates mise with the correct config file
3. Sources all aliases and functions
4. Provides visual feedback on successful loading

### Tool Version Consistency

Using mise ensures that all developers on your team use the same versions of critical development tools, preventing "works on my machine" issues.

## Troubleshooting

### DevKit not loading on shell startup

Make sure the following lines are in `~/.zprofile` (not `~/.zshrc`):

```bash
export DEVKIT_DIR=~/Workzone/devkit
source ${DEVKIT_DIR}/devkit.sh
```

### mise tools not available

1. Check that mise is installed: `which mise`
2. Verify mise config path: `echo $MISE_CONFIG_FILE`
3. Manually run: `mise install`

### Environment variables not loading

1. Verify the `.env` file exists: `ls ${DEVKIT_DIR}/.env`
2. Check file syntax (should be `export VAR=value` format)
3. Reload shell: `source ~/.zprofile`

## Contributing

To add new features or aliases:

1. Follow the existing code structure
2. Add emoji-prefixed category headers in `alias.sh`
3. Document any new environment variables or dependencies
4. Test in a fresh shell session

## License

[Add your license here]

## Acknowledgments

- [mise](https://mise.jdx.dev/) - Unified tool version manager
- [Homebrew](https://brew.sh/) - Package manager for macOS
- [Claude Code](https://claude.ai/) - AI-powered development assistant
