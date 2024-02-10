filetype off                  " required
" Search down into subfolders
" Provide tab-completion for all file-related tasks
set path+=**
" display all matching files when tab complete
set wildmenu

"Make search case insesitive
set hlsearch
set incsearch
set ignorecase
set smartcase
set nohlsearch "This is to remove the highlighting after searching

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-----==========---------------==============---End of bundle-----------==============-----------============

" Set compactibility mode to vim only
set nocompatible

"Automatically wrap text that extends beyond the screen lenght
set wrap

"Encoding
set encoding=utf-8

"show line number
set number
set relativenumber

"Automatic deletes trailing white spaces on save
"autocmd BufWritepre * %s/\s\
"status bar
set laststatus=2

"=-=-=-=-=-start of betty=-=-=-=-=-=
"Tabs
set tabstop=8 shiftwidth=8

"Indentation
set autoindent

"intelligent indentation
set smartindent
set cindent

let g:ale_linters = {'c':['betty-style', 'betty-doc', 'betty', 'gcc']}
"-=-=-=-=-=-=End of betty styling-=-=-=-=-=-

"set to change buffer without saving
set hidden
set noswapfile

"view file folder stucture
inoremap <c-n> <Esc>:Lex<cr>:vertical resize 30<cr>
nnoremap <c-n> <Esc>:Lex<cr>:vertical resize 30<cr>

"Remap split navigations to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"--------------fold------========-----------
set foldmethod=manual
autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview

"-------===========----------=========-------=====Python synatax -------========---------
syntax on
set t_Co=256

set foldlevel=99
nnoremap <space> za
"remapping jj to be escape key 
imap jj <Esc>
" remapped the : to be ; to enter command mode
nnoremap ; :
"Esc in visual mode
xnoremap x <Esc>

au BufNewFile, BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix
	\ set shiftround
	
let g:ale_linters = {'python': ['flake8']}

"===========----------------========Openning and closing bracket======---------=======
""" Automatically closing braces
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
""inoremap " ""<Esc>ha
""inoremap ' ''<Esc>ha
""inoremap ` ``<Esc>ha

"to change the cursor
set guicursor=n-v-c-i:block
set guicursor=a:blinkon100
set mouse=

"to disable the arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set scrolloff=8

let g:python3_host_prog = '/usr/bin/python'
"-----coc color schemes-------------
hi CocFloating ctermfg=Black ctermbg=White
hi CocPumShortcut ctermfg=Black 
"------End of Coc  Color scheme-------



"Javascript
"let g:syntastic_javascript_checkers=['standard']
"let g:syntastic_javascript_standard_exec = 'semistandard'

" For automatic formatting on save
"autocmd bufwritepost *.js silent !semistandard % --fix
"set autoread


" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0



" ale linters for javascript
"let g:ale_linters = {
"\   'javascript': ['standard'],
"\}
"let g:ale_fixers = {'javascript': ['standard']}

let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" leader keys
let mapleader = "," " map leader to comma

"Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fd <cmd>Telescope <cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


"set background=dark " or light if you want light mode
"colorscheme gruvbox
" color gruvbox
" highlight Normal     ctermbg=NONE guibg=NONE
" highlight LineNr     ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE


map <leader>d :ALEDisable<CR>
map <leader>a :ALEEnable<CR>

" autocmd BufEnter * TSBufDisable highlight
let g:ts_install_types = ["javascript", "markdown", "markdown_inline", "typescript", "c", "lua", "rust"]

" Install parsers synchronously (only applied to `ensure_installed`)
let g:ts_sync_install = 0

" Automatically install missing parsers when entering buffer
" Recommendation: set to 0 if you don't have `tree-sitter` CLI installed locally
let g:ts_auto_install = 1

" Highlighting configuration
let g:ts_highlight_enabled = 1

" Setting this to 1 will run `:h syntax` and tree-sitter at the same time.
" Set this to `1` if you depend on 'syntax' being enabled (like for indentation).
" Using this option may slow down your editor, and you may see some duplicate highlights.
" Instead of 1, it can also be a list of languages
let g:ts_additional_vim_regex_highlighting = 0



