-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "lua",
      "yaml",
      "json",
      "terraform",
      "hcl",
      "python",
      "go",
      "dockerfile",
      "markdown",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

