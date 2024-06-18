# NeoVim config

## What is included
- catppuccin (theme)
- lualine (status bar)
- neo-tree
- telescope + telescope-ui-select
- treesitter
- window-picker
- mason + lsp-config
- alpha (dashboard)
- cmp + LuaSnip (completion)
- dap + dapui (debugging)
- friendly-snippets (snippets)

> Some of them are configured explicitly, some of them are not (yet).

## What languages are supported?
- c#
- rust
- lua
- javascript/typescript

> work in progress

## How to
1. Clone the repository 
2. Place its content (for MacOS) to `.config/nvim` directory
3. Using `:Mason` install necessary packages: `stylua`, `codelldb`, `prettier` and `eslint_d`.
4. Restart the `nvim`.

## Languages

As for now, these LSP are configured (WIP):
- lua
- rust
- C#
- TypeScript
