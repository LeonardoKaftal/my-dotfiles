-- Standalone plugins with less than 10 lines of config go here
return {
	{
		-- Tmux & split window navigation
		"christoomey/vim-tmux-navigator",
		vim.keymap.set("n", "C-h", ":TmuxVavigateLeft<CR>"),
		vim.keymap.set("n", "C-l", ":TmuxVavigateRightCR>"),
		vim.keymap.set("n", "C-k", ":TmuxVavigateUp<CR>"),
		vim.keymap.set("n", "C-k", ":TmuxVavigateDown<CR>"),
	},
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- Configurazione opzionale per which-key
		},
		keys = {
			-- Mostra i keymap locali del buffer con <leader>?
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
			-- Mostra tutti i keymap globali con <leader>w
			{
				"<leader>w",
				function()
					require("which-key").show({ global = true })
				end,
				desc = "Show Global Keymaps (which-key)",
			},
		},
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"romainl/vim-cool",
		config = function() end,
	},
}
