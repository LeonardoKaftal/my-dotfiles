return {
  "vim-test/vim-test",
  config = function()
    -- Mappatura delle chiavi direttamente in Lua
    vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', { desc = 'Esegui il test più vicino' })
    vim.keymap.set('n', '<leader>T', ':TestFile<CR>', { desc = 'Esegui i test del file' })
    vim.keymap.set('n', '<leader>a', ':TestSuite<CR>', { desc = 'Esegui tutti i test' })
    vim.keymap.set('n', '<leader>l', ':TestLast<CR>', { desc = 'Ripeti l\'ultimo test' })
    vim.keymap.set('n', '<leader>g', ':TestVisit<CR>', { desc = 'Visita il test' })
  end,
}
