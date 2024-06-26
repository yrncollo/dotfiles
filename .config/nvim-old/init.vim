call plug#begin()
Plug 'wakatime/vim-wakatime'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'dense-analysis/ale'
Plug 'nvie/vim-flake8'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-snippets'
Plug 'vim-syntastic/syntastic'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.4'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'github/copilot.vim'
Plug 'nvim-neorg/neorg'

" plugins for js and React 
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'mbbill/undotree'

" Plugins for rust


call plug#end()

" Ignore the target directory
set wildignore+=*/target/*

" Add Lua configuration
runtime! ./lua/*.lua 

set bs=2 "make backspace behave like normal backspace
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
nnoremap <Alt> <C-w>h
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

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

set scrolloff=8

let g:python3_host_prog = '/usr/bin/python'
"-----coc color schemes-------------
hi CocFloating ctermfg=Black ctermbg=White
hi CocPumShortcut ctermfg=Black 
"------End of Coc  Color scheme-------

" the script below removes some stupid Inlay hint on coc 
nnoremap <c-q> <Esc>:CocCommand document.toggleInlayHint<cr>

"------=========--------=====Coc vim script START---========-----------------"
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
highlight CocHintFloat ctermfg=Red  guifg=#ff0000


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
colorscheme gruvbox
"set background=dark
"color gruvbox
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

map <leader>d :ALEDisable<CR>
map <leader>a :ALEEnable<CR>


" remapping split navigation from ctrl + w + s to <leader> + j and ctrl + w + v to <leader> + l 
map <leader>l <C-w>s
map <leader>j <C-w>v
" remapping closing split navigation from ctrl + w + q to <leader> + q 
map <leader>q <C-w>q

autocmd BufEnter * TSBufDisable highlight
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

" Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
" noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>


" copilot configurations
imap <silent><script><expr> <A-Space> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
map <leader>t :Copilot disable<CR>
map <leader>r :Copilot enable<CR>
autocmd VimEnter * Copilot disable

map <leader>u :UndotreeToggle<CR>

" vim-javascript
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

nmap <leader>y "+y

"neorg configurations 
lua << EOF
require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
    },
}
EOF

