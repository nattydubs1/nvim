-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- Mason still handles binaries
    require("mason").setup()

    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "yamlls",
        "jsonls",
        "terraformls",
        "ansiblels",
        "pyright",
        "gopls",
        "lua_ls",
      },
    })

    -- Lua (Neovim aware)
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    })

    -- Servers
    for _, server in ipairs({
      "bashls",
      "yamlls",
      "jsonls",
      "terraformls",
      "ansiblels",
      "pyright",
      "gopls",
    }) do
      vim.lsp.config(server, {})
    end

    -- Enable everything
    vim.lsp.enable({
      "lua_ls",
      "bashls",
      "yamlls",
      "jsonls",
      "terraformls",
      "ansiblels",
      "pyright",
      "gopls",
    })
  end,
}

