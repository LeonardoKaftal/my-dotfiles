return {
	"rcarriga/nvim-notify",
	config = function()
		local status, notify = pcall(require, "notify")
		if not status then
			print("nvim-notify non è stato caricato correttamente.")
			return
		end

		-- Imposta nvim-notify come il gestore predefinito per vim.notify
		vim.notify = notify

		-- Configurazione di nvim-notify
		notify.setup({
			stages = "fade_in_slide_out",
			timeout = 2000, -- Tempo di visualizzazione delle notifiche
			background_colour = "#000000",
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
		})
	end,
}
