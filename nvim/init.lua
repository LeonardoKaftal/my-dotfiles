require("core.options") -- Load general options
require("core.keymaps") -- Load general keymaps

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Aggiornamento di lua/plugins/init.lua per includere Noice e Notify
require("lazy").setup({
	require("plugins.neotree"),
	require("plugins.colortheme"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.telescope-undo"),
	require("plugins.autocompletion"),
	require("plugins.lsp"),
	require("plugins.gitsigns"),
	require("plugins.alpha"),
	require("plugins.noice"),
	require("plugins.nvim-notify"),
	require("plugins.misc"),
	require("plugins.none-ls"),
	require("plugins.multicursor"),
	require("plugins.vim-test"),
})
