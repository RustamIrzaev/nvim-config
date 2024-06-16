return { 
  "nvim-neo-tree/neo-tree.nvim", 
  branch = "v3.x", 
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      sort_case_insensitive = false,
      sort_function = nil,
      default_component_configs = {
        container = {
          enable_character_fade = true
        },
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "|",
          highlight = "NeoTreeIndentMarker",
          with_expanders = nil,
          expander_highlight = "NeoTreeExpander",
        },
      },
      commands = {},
      window = {},
      nesting_rules = {},
      filesystem = {},
      buffers = {},
      git_status = {},
    })

    vim.cmd([[nnoremap \ :Neotree reveal<cr>]])
  end
}
