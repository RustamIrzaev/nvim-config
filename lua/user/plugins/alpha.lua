local alpha = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

function alpha.config()
  local dashboard = require("alpha.themes.startify")
  -- local icons = require("user.helpers.icons")

  dashboard.section.header.val = {
    [[╔─────────────────────────────────╗]],
    [[│   ____  _   _ ____ _____        │]],
    [[│  |  _ \| | | / ___|_   _|   _   │]],
    [[│  | |_) | | | \___ \ | || | | |  │]],
    [[│  |  _ <| |_| |___) || || |_| |  │]],
    [[│  |_| \_\\___/|____/ |_| \__, |  │]],
    [[│                         |___/   │]],
    [[╚─────────────────────────────────╝]],
  }

  -- dashboard.section.footer.val = function() end

  -- dashboard.section.buttons.val = {
  --   button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
  --   button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
  --   button("p", icons.git.Repo .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  --   button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
  --   button("t", icons.ui.Text .. " Find text", ":Telescope live_grep <CR>"),
  --   button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  --   button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
  -- }

  -- dashboard.section.header.opts.hl = "Keyword"
  -- dashboard.section.buttons.opts.hl = "Include"
  -- dashboard.section.footer.opts.hl = "Type"

  -- dashboard.opts.opts.noautocmd = true

  require("alpha").setup(dashboard.opts)
end

return alpha