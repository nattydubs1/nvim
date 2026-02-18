-- lua/plugins/alpha.lua
return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "  ██████╗ ██████╗  █████╗  ██████╗██╗   ██╗██╗      █████╗ ",
      "  ██╔══██╗██╔══██╗██╔══██╗██╔════╝██║   ██║██║     ██╔══██╗",
      "  ██║  ██║██████╔╝███████║██║     ██║   ██║██║     ███████║",
      "  ██║  ██║██╔══██╗██╔══██║██║     ██║   ██║██║     ██╔══██║",
      "  ██████╔╝██║  ██║██║  ██║╚██████╗╚██████╔╝███████╗██║  ██║",
      "  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝",
    }

    dashboard.section.buttons.val = {
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    dashboard.section.footer.val = "Dracula Mode Activated 🧛‍♀️"
    alpha.setup(dashboard.opts)

    local purple = "#BD93F9"
    local pink   = "#FF79C6"
    local cyan   = "#8BE9FD"
    local muted  = "#6272A4"

    local function set_highlights()
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = purple })
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = pink })
      vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = cyan })
      vim.api.nvim_set_hl(0, "AlphaFooter", { fg = muted })
      vim.api.nvim_set_hl(0, "Keyword", { fg = purple })
      vim.api.nvim_set_hl(0, "Type", { fg = purple })
      vim.api.nvim_set_hl(0, "String", { fg = pink })
      vim.api.nvim_set_hl(0, "Function", { fg = "#CBA6F7" })
    end

    set_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = set_highlights,
    })
  end,
}
