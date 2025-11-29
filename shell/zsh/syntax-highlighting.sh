#!/usr/bin/env zsh

# ZSH Syntax Highlighting
# Only load if running in zsh
if [ -n "$ZSH_VERSION" ]; then
  # Using brew --prefix for more reliable path resolution
  if command -v brew >/dev/null 2>&1 && brew list zsh-syntax-highlighting >/dev/null 2>&1; then
    source "$(brew --prefix zsh-syntax-highlighting)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  fi
fi