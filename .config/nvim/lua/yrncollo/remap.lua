vim.g.mapleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- This is to remap Escape key to jj
vim.keymap.set("i", "jj", "<Esc>")

-- This is to remap : to ; so as entering command mode to be easy
vim.keymap.set("n", ";", ":")

-- This is to remap : to ; so as entering command mode to be easy
vim.keymap.set("n", ";", ":")

-- Remapping Esc in visual mode
vim.keymap.set("x", "x", "<Esc>")

-- remapping spit navigation to from ctr + w + s to <leader> + j and ctrl + w + v to <leader> + l
vim.keymap.set("n", "<leader>l", "<C-w>s")
vim.keymap.set("n", "<leader>j", "<C-w>v")

-- Closing split navigation
vim.keymap.set("n", "<leader>q", "<C-w>q")


-- Remap split navigation to just CTRL + hjkl
vim.keymap.set("n", "<Alt>", "<C-w>h")
vim.keymap.set("n", "C-j", "<C-w>j")
vim.keymap.set("n", "C-k", "<C-w>k")
vim.keymap.set("n", "C-l", "<C-w>l")

--Disable the arrow keys
