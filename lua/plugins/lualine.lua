return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula-nvim",
				icons_enabled = true,
				globalstatus = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { { "mode", upper = true } },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}

