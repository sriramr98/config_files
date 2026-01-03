#!/bin/bash

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Returns true if a command exists, else false
command_exists() {
    command -v "$1" &> /dev/null
}

brew_install() {
    local package=$1
    local command=${2:-$1}  # Use second argument if provided, otherwise use package name

    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    if ! command_exists $command; then
      echo -e "${BLUE}✨ Installing ${YELLOW}$package${BLUE}...${NC}"
      brew install $package >> brew_install.log 2>&1
      echo -e "${GREEN}✅ $package installed successfully${NC}"
    else
        echo -e "${GREEN}✓ $package already installed${NC}"
    fi
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

to_install=("fzf" "zoxide" "starship" "stow" "neovim" "eza")

# Map package names to their command names (if different)
declare -A command_map=(
    ["neovim"]="nvim"
)

if ! command_exists brew; then
  echo 'Installing brew..'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo 'brew already installed'
fi

for package in "${to_install[@]}"; do
    command_name="${command_map[$package]:-$package}"
    brew_install $package $command_name
done

echo 'Stow exists.. Setting up configuration..'
stow . -t ~
