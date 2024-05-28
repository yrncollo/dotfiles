-- Map <A-Space> to copilot#Accept("<CR>")
--vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
--  expr = true,
--  replace_keycodes = false
--})
--

vim.keymap.set('i', '<A-Space>', 'copilot#Accept("<CR>")', { noremap = true, silent = true, expr = true, script = true , replace_keycodes = false })

-- Set copilot_no_tab_map to true
vim.g.copilot_no_tab_map = true

-- Map <leader>t to disable Copilot
vim.keymap.set('n', '<leader>t', ':Copilot disable<CR>')
--
-- Map <leader>r to enable Copilot
vim.keymap.set('n', '<leader>r', ':Copilot enable<CR>')

-- Disable Copilot on startup after like 100ms
--
vim.defer_fn(function()
    vim.cmd('Copilot disable')
end, 100)
