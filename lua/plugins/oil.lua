-- lua/plugins/oil.lua
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>e", function() require("oil").open_float() end, desc = "Oil (float)" },
  },
  opts = {
    default_file_explorer = true,

    view_options = {
      show_hidden = true,
    },

    float = {
      padding = 1,
      max_width = 60,
      max_height = 20,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
  },
}
