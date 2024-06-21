local theme = {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
}

function theme.config()
  require("catppuccin").setup({
    flavour = "mocha",
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = true,
    }
  })

  vim.cmd.colorscheme("catppuccin")
end

return theme