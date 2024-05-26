-- Disable swap files
vim.opt.swapfile = false

-- To show line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Change buffers without saving
vim.opt.hidden = true

-- Disable mouse both normal mode and insert mode
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
-- Insert mode
vim.keymap.set("i", "<Up>", "<Nop>")
vim.keymap.set("i", "<Down>", "<Nop>")
vim.keymap.set("i", "<Left>", "<Nop>")
vim.keymap.set("i", "<Right>", "<Nop>")

-- Mouse
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.guicursor = "a:blinkon100"
vim.opt.mouse = "" -- Disable mouse


-- Make search case insensitive
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false -- To remove hightlighting after searching

-- text wrapping
vim.opt.wrap = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- Display all matching files when tab complete
vim.opt.wildmenu = true

-- Make backspace behave like normal backspace

-- Enable file detection, plugin and indent
vim.cmd("filetype plugin indent on")

--Status bar
vim.opt.laststatus = 2

-- Betty style C lang
vim.opt.tabstop = 8
vim.opt.shiftwidth= 8
vim.g.ale_linters = {
    c = {'betty-style', 'betty-doc', 'betty', 'gcc'}
}

--fold methods
vim.opt.foldmethod = "manual"

--Enable color support
vim.opt.termguicolors = true

-- Python syntax
vim.cmd([[
augroup python_settings
    autocmd!
    autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix shiftround
augroup END
]])

vim.g.ale_linters = {
    python = {'flake8'}
}
vim.opt.scrolloff = 8
vim.g.python3_host_prog = '/usr/bin/python'






