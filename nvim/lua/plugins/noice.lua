-- lua/plugins/noice.lua
return {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim", -- Interfaccia UI per supportare Noice
		"rcarriga/nvim-notify", -- Notifiche per Neovim
	},
	config = function()
		require("noice").setup({
			cmdline = {
				enabled = true,
				view = "cmdline_popup", -- Crea una finestra popup per i comandi
				format = {
					cmdline = { pattern = "^:", icon = "", lang = "vim" },
				},
			},
			messages = {
				enabled = true,
				view = "mini", -- Visualizza i messaggi in un'area piccola e minimalista
			},
			notify = {
				enabled = true, -- Abilita le notifiche
			},
			lsp = {
				hover = {
					enabled = true,
				},
				signature = {
					enabled = true,
				},
			},
			presets = {
				bottom_search = true, -- Sposta la ricerca in basso
				command_palette = true, -- Aggiunge una palette stile VS Code per i comandi
				long_message_to_split = true, -- I messaggi lunghi vengono separati
			},
		})
	end,
}
