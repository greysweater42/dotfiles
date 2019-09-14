syntax on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus

" plugins {{{
call plug#begin('~/.vim/plugged')

    " jedi for python - autocomplerion and docs data
    " Plug 'davidhalter/jedi-vim'   

    " asynchronous lint engine (pep8)
    " pip3 install flake8
    Plug 'dense-analysis/ale'

    " color and sort imports
    " Plug 'tweekmonster/impsort.vim'  

    " python autocompletion plugin
    Plug 'ncm2/ncm2'  
    Plug 'roxma/nvim-yarp'  " dependency of ncm2

    " fast python completion (use ncm2 if you want type info or snippet support)
    Plug 'HansPinckaers/ncm2-jedi'  

    " buffer keyword completion
    Plug 'ncm2/ncm2-bufword'  

    " filepath completion
    Plug 'ncm2/ncm2-path'  

    " colorscheme
    Plug 'altercation/vim-colors-solarized'

    " buffer line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " python repl
    Plug 'jalvesaq/vimcmdline'

    " R repl
    Plug 'jalvesaq/Nvim-R'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " nerdtree
    Plug 'scrooloose/nerdtree'

    " csv files support
	Plug 'chrisbra/csv.vim'

    " instead of ctrlp - fuzzy search
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'

    " c/c++ support
    Plug 'vim-scripts/c.vim'

    " git plugin
    Plug 'tpope/vim-fugitive'

    " easily change surrouning with cs
    Plug 'tpope/vim-surround'

    " rainbow parentheses
    Plug 'luochen1990/rainbow'

    " ctrlp for fuzzy files search
    Plug 'kien/ctrlp.vim'

call plug#end()
" }}}
" hotkeys and options {{{
augroup exit_group
    command! Q q
    command! W w
    command! WQ wq
    command! Wq wq    
augroup END
" move line down
nnoremap - :m .+1<CR>==
" move line up
nnoremap _ :m .-2<CR>==
" convert the current word to uppercase
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU
" remap escape to jk and kj
inoremap jk <Esc>
" moving inside lines
nnoremap j gj
nnoremap k gk
" set leader
let maplocalleader=","
let mapleader=";"
" folding
set foldmethod=indent
set foldlevel=99
" no backup
set nobackup
set nowritebackup
set noswapfile
" search settings
set hlsearch incsearch
nnoremap <CR> :noh<CR><CR>
" backspace
set backspace=indent,eol,start
" complete with TAB
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible()? "\<c-p>":"\<c-d>"
" This is almost a must if you wish to use buffers in this way.
set hidden
" Move to the next buffer
nmap <leader>l :bnext<CR>
tnoremap <leader>l <C-\><C-N>:bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" moving between panes
tnoremap <M-h> <C-\><C-N><C-w>h
tnoremap <M-j> <C-\><C-N><C-w>j
tnoremap <M-k> <C-\><C-N><C-w>k
tnoremap <M-l> <C-\><C-N><C-w>l
inoremap <M-h> <C-\><C-N><C-w>h
inoremap <M-j> <C-\><C-N><C-w>j
inoremap <M-k> <C-\><C-N><C-w>k
inoremap <M-l> <C-\><C-N><C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
"}}}

" view {{{
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let &colorcolumn=81
set number
set relativenumber
" preview window
set previewheight=5
au BufEnter ?* call PreviewHeightWorkAround()
function! PreviewHeightWorkAround()
    if &previewwindow
        exec 'setlocal winheight='.&previewheight
    endif
endfunc
set splitbelow
" indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix
" completion with ctrl+space
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
" highlighting TODO
highlight MyGroup ctermbg=21 guibg=green
match MyGroup /TODO/
" }}}
" python autocompletion settings {{{
" ncm2 settings
autocmd Filetype python call ncm2#enable_for_buffer()
autocmd FileType python setlocal completeopt=menuone,noselect,noinsert
" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'

" python tags
autocmd FileType python nmap <F4> :!ctags -R .<Return>
" height of dropdown list
set pumheight=10

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent> <expr> <CR> (pumvisible() && empty(v:completed_item)) ?  "\<c-y>\<cr>" : "\<CR>"

" jedi options
" let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0
" }}}


" airline
let g:airline_powerline_fonts = 1
set laststatus=2  " always show status line
let g:airline_theme='laederon'
let g:airline#extensions#tabline#enabled = 1

" vimcmdline mappings
let cmdline_map_start          = '<F2>'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>p'
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>q'

" vimcmdline options
let cmdline_vsplit      = 1      " Split the window vertically
let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height = 15     " Initial height of interpreter window or pane
let cmdline_term_width  = 80     " Initial width of interpreter window or pane
let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
let cmdline_outhl       = 1      " Syntax highlight the output
let cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)

let cmdline_app           = {}
let cmdline_app['python'] = 'ipython3'
let cmdline_app['sh']     = 'bash'

" deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#source('buffer', 'filetypes', ['r'])
call deoplete#custom#option('omni_patterns', {
    \ 'r'   : ['[^. *\t]\.\w*', '\h\w*::\w*', '\h\w*\$\w*', '\h\w*\w*', '\h\w*(w*']
    \})

map <C-n> :NERDTreeToggle<CR>

" terminal's default mode is insert
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" vim-fugitive
noremap <c-g> :Gstatus<CR>

autocmd FileType r nmap <buffer> <Space> <LocalLeader>l<Enter>
autocmd FileType r nmap <buffer> <F2> <LocalLeader>rf
autocmd FileType r nmap <buffer> <LocalLeader>h <LocalLeader>rh
autocmd FileType r nmap <buffer> K <LocalLeader>rh
autocmd FileType r nmap <buffer> <LocalLeader>v <LocalLeader>rv
let R_close_term = 1
let R_assign = 0

"
" csv
autocmd BufNewFile,BufRead *.csv nmap <leader>q :bp <BAR> bd! #<CR>

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
