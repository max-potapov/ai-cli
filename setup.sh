#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🚀 AI-CLI Setup Script"
echo "====================="
echo ""

# Check if Zellij is installed
if ! command -v zellij &> /dev/null; then
    echo -e "${RED}❌ Zellij is not installed!${NC}"
    echo "Please install Zellij first: https://zellij.dev/documentation/installation"
    exit 1
fi

echo -e "${GREEN}✓ Zellij is installed${NC}"

# Create Zellij layouts directory if it doesn't exist
ZELLIJ_LAYOUT_DIR="$HOME/.config/zellij/layouts"
if [ ! -d "$ZELLIJ_LAYOUT_DIR" ]; then
    echo "Creating Zellij layouts directory..."
    mkdir -p "$ZELLIJ_LAYOUT_DIR"
fi

# Copy the layout file
echo "Installing ai-coding layout..."
cp ai-coding.kdl "$ZELLIJ_LAYOUT_DIR/"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Layout file installed to $ZELLIJ_LAYOUT_DIR/ai-coding.kdl${NC}"
else
    echo -e "${RED}❌ Failed to copy layout file${NC}"
    exit 1
fi

# Check if ai-cli alias already exists
if grep -q "alias ai-cli=" "$HOME/.zshrc" 2>/dev/null; then
    echo -e "${YELLOW}⚠ ai-cli alias already exists in .zshrc${NC}"
    echo "Current alias:"
    grep "alias ai-cli=" "$HOME/.zshrc"
else
    # Add alias to .zshrc
    echo "" >> "$HOME/.zshrc"
    echo "# Zellij AI CLI alias" >> "$HOME/.zshrc"
    echo "alias ai-cli='zellij --layout ai-coding'" >> "$HOME/.zshrc"
    echo -e "${GREEN}✓ Added ai-cli alias to .zshrc${NC}"
fi

# Check if .bashrc exists and add alias there too
if [ -f "$HOME/.bashrc" ]; then
    if ! grep -q "alias ai-cli=" "$HOME/.bashrc" 2>/dev/null; then
        echo "" >> "$HOME/.bashrc"
        echo "# Zellij AI CLI alias" >> "$HOME/.bashrc"
        echo "alias ai-cli='zellij --layout ai-coding'" >> "$HOME/.bashrc"
        echo -e "${GREEN}✓ Added ai-cli alias to .bashrc${NC}"
    fi
fi

echo ""
echo -e "${GREEN}🎉 Setup complete!${NC}"
echo ""
echo "To use the ai-cli command:"
echo "1. Reload your shell configuration:"
echo "   source ~/.zshrc"
echo ""
echo "2. Run the command:"
echo "   ai-cli"
echo ""
echo "The layout includes:"
echo "- Code tab: Claude, ccusage blocks, and cursor-agent"
echo "- Review tab: cursor-agent"
echo "- Terminal tab: Regular terminal"