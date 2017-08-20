execute pathogen#infect()
syntax on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus

"""""" hotkeys
" write and quit 
command Q q
command W w
command WQ wq
command Wq wq
" move line down
nnoremap - :m .+1<CR>==
" move line up
nnoremap _ :m .-2<CR>==
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
" moving inside lines
nnoremap j gj
nnoremap k gk
" set leader
let maplocalleader=","
let mapleader=";"
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
" 'stamp' - replace a word with yanked text
nnoremap S diw"0P

"""""" view
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let &colorcolumn=81
set number
autocmd VimEnter * RltvNmbr
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
au BufRead,BufNewFile *.R nmap <Space> <LocalLeader>l<Enter>
au BufRead,BufNewFile *.Rnw nmap <Space> <LocalLeader>l<Enter>
au BufRead,BufNewFile *.Rnw nmap <F2> <LocalLeader>kp
au BufRead,BufNewFile *.Rnw nmap <F3> <LocalLeader>op
let R_args_in_stline = 1
au BufRead,BufNewFile *.Rnw nmap <LocalLeader>rf <Plug>RStart
let g:ycm_semantic_triggers = { 'r' : ['::', '$', '@'] }

" vim-airline (powerline)
let g:airline_powerline_fonts = 1
set laststatus=2  " always show status line
let g:airline_theme='laederon'

" vim-latex
map <F2> <Esc>:w<Enter><leader>ll<Return>
map <F4> <Esc><leader>ll<Return>:<C-U>exec '!biber '.Tex_GetMainFileName(':p:t:r')<CR><leader>ll<Return>
map <F3> <leader>lv
let g:Tex_ViewRule_pdf = 'zathura'
let g:Tex_DefaultTargetFormat = 'pdf'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python-mode
let g:pymode_python = 'python3'
let g:pymode_rope_completion = 0  " use YouCompleteMe instead
"map <F5> <Esc><leader>r
nnoremap <F5> :exec 'w !python3'<cr>
" screen (for python)
au BufRead,BufNewFile *.py nmap <F2> :ScreenShell ipython<Return>
au BufRead,BufNewFile *.py nmap <Space> V:ScreenSend<Return>j

" gitgutter
set updatetime=250
let g:gitgutter_max_signs = 500  " default value

" rainbow (parentheses)
let g:rainbow_active = 1 

" csv
let g:csv_autocmd_arrange = 1

let g:Tex_SmartKeyDot=0
