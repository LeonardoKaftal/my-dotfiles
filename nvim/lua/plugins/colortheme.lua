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
			transparent = true, -- Attiva la trasparenza per il tema
			dimInactive = false,
			terminalColors = true,
			colors = {
				palette = {},
				theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
			},
			overrides = function(colors)
				return {
					-- Imposta lo sfondo come trasparente per le colonne dei numeri e dei segni
					LineNr = { bg = "NONE" },
					CursorLineNr = { bg = "NONE" },
					SignColumn = { bg = "NONE" },
					-- Aggiungi altre colonne se necessario, ad esempio 'FoldColumn'
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
