#!/usr/bin/env bash
# ============================================================
# Claude-DeepSeek Bridge Installer
# ============================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

echo ""
echo -e "${BOLD}Claude-DeepSeek Bridge — Setup${NC}"
echo "----------------------------------------"

# --- Step 1: Create command directory ---
mkdir -p .claude/commands
echo -e "${GREEN}[OK]${NC} Initialized .claude/commands/"

# --- Step 2: Copy slash commands ---
if [ -f commands/deepseek ] && [ -f commands/deepseek-pro ]; then
    cp commands/deepseek .claude/commands/deepseek
    cp commands/deepseek-pro .claude/commands/deepseek-pro
    [ -f commands/deepseek.cmd ] && cp commands/deepseek.cmd .claude/commands/deepseek.cmd
    [ -f commands/deepseek-pro.cmd ] && cp commands/deepseek-pro.cmd .claude/commands/deepseek-pro.cmd
    chmod +x .claude/commands/deepseek .claude/commands/deepseek-pro
    echo -e "${GREEN}[OK]${NC} Installed /deepseek and /deepseek-pro commands"
else
    echo -e "${RED}[ERROR]${NC} Directory commands/ not found. Ensure execution from repository root."
    exit 1
fi

# --- Step 3: Check Python ---
PYTHON_BIN=""
if command -v python3 &> /dev/null; then
    PYTHON_BIN="python3"
elif command -v python &> /dev/null; then
    PYTHON_BIN="python"
else
    echo -e "${RED}[ERROR]${NC} Python 3.8+ is required but not found in PATH."
    exit 1
fi
echo -e "${GREEN}[OK]${NC} Python runtime detected (${PYTHON_BIN})"

# --- Step 4: Detect shell config file ---
if [ -n "$ZSH_VERSION" ] || [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
    config_file="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ] || [ "$SHELL" = "/bin/bash" ] || [ "$SHELL" = "/usr/bin/bash" ]; then
    config_file="$HOME/.bashrc"
else
    config_file="$HOME/.profile"
fi

# --- Step 5: API Key ---
if [ -z "$DEEPSEEK_API_KEY" ]; then
    echo ""
    echo "DeepSeek API Key Configuration"
    echo "Obtain key at: https://platform.deepseek.com/api_keys"
    echo ""
    if [ -t 0 ]; then
        read -p "Enter DeepSeek API key (or leave blank to configure later): " user_key
    else
        user_key=""
    fi

    if [ -n "$user_key" ]; then
        export DEEPSEEK_API_KEY="$user_key"

        if grep -q "DEEPSEEK_API_KEY" "$config_file" 2>/dev/null; then
            echo -e "${YELLOW}[WARN]${NC} $config_file already contains DEEPSEEK_API_KEY. Skipping append."
        else
            echo "" >> "$config_file"
            echo "# Claude-DeepSeek Bridge" >> "$config_file"
            echo "export DEEPSEEK_API_KEY=\"$user_key\"" >> "$config_file"
            echo -e "${GREEN}[OK]${NC} DEEPSEEK_API_KEY persisted to $config_file"
        fi
    else
        echo -e "${YELLOW}[INFO]${NC} No key entered. Set manually via:"
        echo "  export DEEPSEEK_API_KEY=\"<key>\""
    fi
else
    echo -e "${GREEN}[OK]${NC} DEEPSEEK_API_KEY already configured in environment"
fi

# --- Step 6: System prompt configuration ---
if [ ! -f .claude/settings.json ]; then
    if [ -f .claude/settings.example.json ]; then
        cp .claude/settings.example.json .claude/settings.json
        echo -e "${GREEN}[OK]${NC} Initialized .claude/settings.json"
    fi
else
    echo -e "${YELLOW}[INFO]${NC} .claude/settings.json exists (preserved)"
fi

# --- Step 7: Summary ---
echo ""
echo -e "${GREEN}[OK] Setup completed successfully.${NC}"
echo ""
echo "Next steps:"
echo "  1. Reload shell:  source $config_file"
echo "  2. Run Claude:    claude"
echo "  3. Usage:         /deepseek <prompt>"
echo "                    /deepseek-pro <complex prompt>"
echo ""
