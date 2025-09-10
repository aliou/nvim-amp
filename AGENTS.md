# AGENTS.md

## Build/Test Commands
- No build process required (Neovim Lua plugin)
- Test manually by opening `.amp.md` or `permissions.txt` files
- Check syntax highlighting with `:syntax list` and `:set filetype?`
- Use `lua-language-server` for Lua linting (available in shell.nix)

## Architecture
- **Simple Neovim plugin** for amp-cli integration
- **plugin/amp.lua**: Filetype detection via `vim.filetype.add()`
- **syntax/amp-permissions.vim**: Syntax highlighting for permission files
- **Compound filetype**: `markdown.amp-agent` inherits markdown + adds @ path highlighting
- **No external dependencies** - pure Vim/Lua

## Code Style
- **Lua**: Follow Neovim conventions, use `vim.*` APIs
- **Syntax files**: Standard Vim syntax with `syn match/keyword`, `hi def link`
- **Naming**: kebab-case for files, camelCase for Lua variables
- **Comments**: Use `--` for Lua, `"` for Vim script
- **File paths**: Always absolute paths for consistency
- **Filetype naming**: Use `amp-*` prefix for amp-related filetypes

## Key Patterns
- Use `vim.filetype.add()` callback for complex filetype setup
- FileType autocmd with `once = true` for syntax additions
- Preserve markdown functionality with compound filetypes
