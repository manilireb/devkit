#!/usr/bin/env zsh

# ============================================================================
# Alias Configuration
# ============================================================================
#
# This file defines all devkit-provided aliases organized by category.
#
# 📖 How to extend this file:
# ---------------------------
# 1a. Use ## with an emoji to create a new category section:
#    ## 🎨 Your Category Name
# 1.b Or just add to en existing category
#
# 2. Add your aliases under the category:
#    alias myalias="command here"
#
# 3. Use single # for inline comments or subcategories (optional):
#    # This is a helpful comment
#
# 4. The devkit-aliases function will automatically parse and display
#    your aliases grouped by these emoji-prefixed categories.
#
# Why is itt important? this file is parsed and printet by the devkit-aliases
# function to display all available aliases.
#
# 💡 Tips:
# - Keep emoji at the start of ## comments for proper parsing
# - Use descriptive category names
# - Group related aliases together
# - Single # comments are ignored by devkit-aliases display
#
# ============================================================================

## ⌨️  Shortcuts Commands
alias copypath="pwd | pbcopy"
alias finder="open ."

## 🔧 DevKit Functions
alias devkit-update='devkit_update'

## ☸️  Kubernetes
alias k="kubectl"

