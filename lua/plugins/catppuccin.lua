return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        notify = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
