return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		-- Optional but recommended for spell suggestions in popup:
		"f3fora/cmp-spell", -- ← add this line
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- === Key changes for aggressive / LazyVim-like completion ===
			completion = {
				autocomplete = { cmp.TriggerEvent.TextChanged }, -- popup on every text change
				keyword_length = 1, -- start after 1 character
			},

			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- changed: no auto-select → safer
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = cmp.config.sources({
				{ name = "copilreturn {
  "Mofiqul/dracula.nvim",
  lazy = false, -- load immediately
  priority = 1000,
  config = function()
    require("dracula").setup({
      -- Customize for Miss Dracula vibe
      colors = {
        bg = "#2d1e3f", -- deeper purple bg (adjust if needed)
        fg = "#f8f8f2",
        comment = "#6272a4",
        pink = "#ff79c6", -- ★ make this dominant
        purple = "#bd93f9",
        cyan = "#8be9fd", -- keep subdued or override to pink if you want
        green = "#50fa7b",
        yellow = "#f1fa8c",
        orange = "#ffb86c",
        red = "#ff5555",
        selection = "#44475a",
        -- Optional: make pink even more prominent
      },
      -- Optional overrides for Treesitter/LSP
      transparent_bg = false, -- or true for floating windows
      lualine_bg = "#2d1e3f",
      -- Example: force pink on functions/keywords
      overrides = {
        ["@function"] = { fg = "#ff79c6" },
        ["@keyword"] = { fg = "#ff79c6" },
      },
    })
    vim.cmd.colorscheme "dracula"
  end,
}ot" },
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "spell", keyword_length = 3 }, -- ← spell suggestions appear in menu
			}, {
				{ name = "buffer" },
			}),
		})
	end,
}

