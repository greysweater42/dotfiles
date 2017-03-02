execute pathogen#infect()
syntax on
filetype plugin indent on
set encoding=utf-8

"""""" hotkeys
" write and quit 
command Q q
command W w
command WQ wq
command Wq wq
" move line down
noremap - ddp
" move line up
noremap _ :d-1<CR>kP
" delete line in insert mode
inoremap <c-d> <Esc>ddi
" convert the current word to uppercase
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU
" moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" remap escape to jk and kj
inoremap jk <Esc>
inoremap kj <Esc>
" moving inside lines
nnoremap j gj
nnoremap k gk
" set leader
let maplocalleader=","
let mapleader=","
" folding
set foldmethod=indent
set foldlevel=99
"nnoremap <space> za
" moving blocks of code - left and right
vnoremap < <gv
vnoremap > >gv
" no backup
set nobackup
set nowritebackup
set noswapfile

"""""" view
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let &colorcolumn=81
set relativenumber             " Show relative line numbers
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

" NERDtree 
map <C-n> :NERDTreeToggle<CR>
" close NERDtree if it is the only pane opened
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$']  " ignore .pyc files

" Nvim-R
let R_in_buffer = 0
let R_tmux_split = 1
au BufRead,BufNewFile *.R nmap <Space> <leader>lj

" vim-airline (powerline)
let g:airline_powerline_fonts = 1
set laststatus=2  " always show status line
let g:airline_theme='laederon'

" Latex-Box
map <F2> <Esc>:w<Enter><leader>ll
map <F3> <leader>lv

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python-mode
let g:pymode_python = 'python3'
let g:pymode_rope_completion = 0  " use YouCompleteMe instead

" gitgutter
set updatetime=250
let g:gitgutter_max_signs = 500  " default value

" rainbow (parentheses)
let g:rainbow_active = 1 

