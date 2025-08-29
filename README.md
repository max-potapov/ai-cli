# AI-CLI - Zellij Layout for AI Coding

A Zellij layout configuration for an AI-powered coding environment with Claude, cursor-agent, and ccusage monitoring.

![AI-CLI](image.png)

## Prerequisites

- [Zellij](https://zellij.dev/documentation/installation) terminal multiplexer
- Claude CLI tool
- cursor-agent
- bunx (for ccusage blocks)

## Installation

### Quick Install

Run the setup script:

```bash
./setup.sh
```

This will:
1. Copy the `ai-coding.kdl` layout to `~/.config/zellij/layouts/`
2. Add the `ai-cli` alias to your shell configuration (`.zshrc` and `.bashrc`)

### Manual Installation

1. Copy the layout file:
```bash
mkdir -p ~/.config/zellij/layouts
cp ai-coding.kdl ~/.config/zellij/layouts/
```

2. Add alias to your shell configuration (`.zshrc` or `.bashrc`):
```bash
alias ai-cli='zellij --layout ai-coding'
```

3. Reload your shell:
```bash
source ~/.zshrc
```

## Usage

Simply run:
```bash
ai-cli
```

This will launch Zellij with the AI coding layout.

## Layout Structure

The layout includes three tabs:

### Code Tab (default)
- Left pane (50%): Claude
- Right top pane (25%): ccusage blocks (live monitoring)
- Right bottom pane (25%): cursor-agent

### Review Tab
- Full pane: cursor-agent

### Terminal Tab
- Full pane: Regular terminal

## Customization

You can modify the `ai-coding.kdl` file to customize:
- Pane sizes
- Commands to run in each pane
- Tab names and order
- Additional tabs or panes

## Troubleshooting

If the `ai-cli` command is not found:
1. Make sure you've reloaded your shell configuration: `source ~/.zshrc`
2. Check that the alias was added correctly: `grep "ai-cli" ~/.zshrc`
3. Ensure Zellij is installed: `which zellij`

## License

MIT