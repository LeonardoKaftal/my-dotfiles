return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = false,
			undercurl = true,
			commentStyle = { italic = true },
			functionStyle = {},
			keywordStyle = { italic = true },
			statementStyle = { bold = true },
			typeStyle = {},
			transparent = true,
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors)
				return {
					LineNr = { bg = "NONE" },
					CursorLineNr = { bg = "NONE" },
					SignColumn = { bg = "NONE" },
				}
			end,
			theme = "wave",
			background = {
				dark = "wave",
				light = "lotus",
			},
		})

		vim.cmd("colorscheme kanagawa-wave")
	end,
}
