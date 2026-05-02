#!/usr/bin/env bash
# ============================================================
#  Claude-DeepSeek Bridge — One-Command Installer
#  Protects your Claude Pro subscription from the Wednesday wall.
# ============================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}╔══════════════════════════════════════════════╗${NC}"
echo -e "${BOLD}║   🧠 Claude-DeepSeek Bridge — Installer      ║${NC}"
echo -e "${BOLD}║   Protect your Pro subscription.             ║${NC}"
echo -e "${BOLD}╚══════════════════════════════════════════════╝${NC}"
echo ""

# --- Step 1: Create command directory ---
mkdir -p .claude/commands
echo -e "${GREEN}✓${NC} Created .claude/commands/"

# --- Step 2: Copy slash commands ---
if [ -f commands/deepseek ] && [ -f commands/deepseek-pro ]; then
    cp commands/deepseek .claude/commands/deepseek
    cp commands/deepseek-pro .claude/commands/deepseek-pro
    chmod +x .claude/commands/deepseek .claude/commands/deepseek-pro
    echo -e "${GREEN}✓${NC} Installed /deepseek and /deepseek-pro commands"
else
    echo -e "${RED}✗${NC} Could not find commands/ directory. Are you in the repo root?"
    exit 1
fi

# --- Step 3: Check Python ---
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}✗${NC} Python 3 is required but not found. Please install Python 3.8+."
    exit 1
fi
echo -e "${GREEN}✓${NC} Python 3 detected"

# --- Step 4: Check for requests library ---
if ! python3 -c "import requests" 2>/dev/null; then
    echo -e "${YELLOW}⚠${NC} Python 'requests' package not found. Installing..."
    pip3 install requests --quiet
    echo -e "${GREEN}✓${NC} requests installed"
else
    echo -e "${GREEN}✓${NC} Python requests library available"
fi

# --- Step 5: API Key ---
if [ -z "$DEEPSEEK_API_KEY" ]; then
    echo ""
    echo -e "${BOLD}DeepSeek API Key${NC}"
    echo -e "Get one at: ${YELLOW}https://platform.deepseek.com/api_keys${NC}"
    echo -e "(Free account, pay-per-use at fractions of a cent.)"
    echo ""
    read -p "Paste your DeepSeek API key: " user_key

    if [ -n "$user_key" ]; then
        export DEEPSEEK_API_KEY="$user_key"

        # Detect shell config
        if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
            config_file="$HOME/.zshrc"
        elif [ -n "$BASH_VERSION" ] || [ "$SHELL" = "/bin/bash" ] || [ "$SHELL" = "/usr/bin/bash" ]; then
            config_file="$HOME/.bashrc"
        else
            config_file="$HOME/.profile"
        fi

        if grep -q "DEEPSEEK_API_KEY" "$config_file" 2>/dev/null; then
            echo -e "${YELLOW}⚠${NC} $config_file already contains DEEPSEEK_API_KEY. Skipping."
        else
            echo "" >> "$config_file"
            echo "# Claude-DeepSeek Bridge" >> "$config_file"
            echo "export DEEPSEEK_API_KEY=\"$user_key\"" >> "$config_file"
            echo -e "${GREEN}✓${NC} API key saved to ${config_file}"
        fi
    else
        echo -e "${YELLOW}⚠${NC} No key entered. Set it manually later with:"
        echo "  export DEEPSEEK_API_KEY=\"your-key-here\""
    fi
else
    echo -e "${GREEN}✓${NC} DeepSeek API key already set in environment"
fi

# --- Step 6: System prompt ---
if [ ! -f .claude/settings.json ]; then
    if [ -f .claude/settings.example.json ]; then
        cp .claude/settings.example.json .claude/settings.json
        echo -e "${GREEN}✓${NC} Created .claude/settings.json with delegation rules"
    else
        echo -e "${YELLOW}⚠${NC} No settings.example.json found. Skipping system prompt setup."
    fi
else
    echo -e "${YELLOW}⚠${NC} .claude/settings.json already exists — left untouched."
    echo "  Review .claude/settings.example.json and merge manually if needed."
fi

# --- Done ---
echo ""
echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════╗${NC}"
echo -e "${GREEN}${BOLD}║   Setup complete!                            ║${NC}"
echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════╝${NC}"
echo ""
echo -e "Next steps:"
echo -e "  1. Reload your shell:  ${BOLD}source $config_file${NC}  (or restart terminal)"
echo -e "  2. Start Claude Code:  ${BOLD}claude${NC}"
echo -e "  3. Try:  ${BOLD}/deepseek Write a Python function to validate email addresses${NC}"
echo -e "  4. Try:  ${BOLD}/deepseek-pro Analyze this code for race conditions${NC}"
echo ""
echo -e "${YELLOW}Claude Opus 4.7 stays in charge. DeepSeek handles the grind.${NC}"
echo -e "${YELLOW}Your Pro subscription just started lasting the whole week.${NC}"
echo ""