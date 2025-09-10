# nvim-amp

A Neovim plugin for enhanced integration with amp-cli, providing syntax highlighting and filetype detection for amp command files.

## Features

### `/editor` Command Support
- **Filetype Detection**: Files created by `amp /editor` (e.g., `message.amp.md`) are detected as `markdown.amp-agent`
- **Syntax Highlighting**: @ file paths (like `@src/main.js`, `@config.json`) are highlighted as constants
- **Markdown Integration**: Full markdown syntax highlighting and features are preserved

### `/permission` Command Support
- **Filetype Detection**: Permission files (`permissions.txt`) are detected as `amp-permissions`
- **Syntax Highlighting**: Custom highlighting for amp permission syntax

## Requirements

- Neovim >= 0.11.0

## Installation

### Using mini.deps

```lua
local MiniDeps = require('mini.deps')
MiniDeps.add({
  source = 'aliou/nvim-amp',
})
```

### Using lazy.nvim

```lua
{
  'aliou/nvim-amp',
  config = function()
    -- Optional configuration
  end,
}
```

### Using Neovim's Native Package System

```bash
# For automatic loading on startup
git clone https://github.com/aliou/nvim-amp.git \
  ~/.local/share/nvim/site/pack/plugins/start/nvim-amp

# Or for optional loading (use :packadd nvim-amp to load)
git clone https://github.com/aliou/nvim-amp.git \
  ~/.local/share/nvim/site/pack/plugins/opt/nvim-amp
```
