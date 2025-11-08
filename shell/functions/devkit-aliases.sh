#!/usr/bin/env zsh

# Function to display only toolkit-provided aliases (grouped by category)
# This function parses the alias.sh file and displays aliases organized by
# emoji-prefixed category headers (## emoji Title)
devkit-aliases() {
  # Use the CLN_TOOLKIT_DIR variable set by cli-extensions.sh
  local alias_file="${DEVKIT_DIR}/shell/alias/alias.sh"

  if [[ ! -f "$alias_file" ]]; then
    echo "❌ Error: Could not find alias file at $alias_file"
    echo "   Make sure DEVKIT_DIR is set correctly: ${DEVKIT_DIR:-'(not set)'}"
    return 1
  fi

  echo ""
  echo "🔧 DevKit Aliases"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""

  local first_section=true

  # Read the file line by line
  while IFS= read -r line; do
    # Skip shebang, empty lines, and decorative section separators
    if [[ "$line" =~ ^#!/ ]] || [[ -z "$line" ]] || [[ "$line" =~ ^#[[:space:]]*=+ ]]; then
      continue
    fi

    # Check if it's a category header (## emoji Title)
    if [[ "$line" =~ ^##[[:space:]]+(.*) ]]; then
      local category="${match[1]}"

      # Skip generic header comments that aren't categories
      if [[ "$category" =~ ^[A-Z][a-z]+[[:space:]][A-Z] ]] && [[ ! "$category" =~ [[:emoji:]] ]]; then
        # This is likely "Alias Configuration" or similar - skip it
        continue
      fi

      # Print section header
      if [[ "$first_section" == false ]]; then
        echo ""
      fi

      echo "${category}"
      echo "─────────────────────────────────────────────────────────────"
      first_section=false

    # Check if it's an alias definition
    elif [[ "$line" =~ ^alias[[:space:]]+(.*) ]]; then
      local alias_def="${match[1]}"
      local name="${alias_def%%=*}"
      local definition="${alias_def#*=}"

      # Remove quotes from definition for cleaner display
      definition="${definition#\"}"
      definition="${definition%\"}"
      definition="${definition#\'}"
      definition="${definition%\'}"

      # Display the alias
      printf "  %-25s → %s\n" "$name" "$definition"
    fi
  done < <(cat "$alias_file"; echo)  # Ensure last line is processed even without trailing newline

  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "💡 Run any alias by typing its name in your terminal"
  echo ""
}
