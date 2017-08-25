execute pathogen#infect()
syntax on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus

" hotkeys and options {{{
"augroup exit_group
"    autocmd!
"    command Q q
"    command W w
"    command WQ wq
"    command Wq wq    
"augroup END
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
" backspace
set backspace=indent,eol,start
"}}}

"" view {{{
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let &colorcolumn=81
set number
set relativenumber
set previewheight=10
au BufEnter ?* call PreviewHeightWorkAround()
func PreviewHeightWorkAround()
    if &previewwindow
        exec 'setlocal winheight='.&previewheight
    endif
endfunc
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
" }}}

" R settings - Nvim-R ---------------- {{{
" NeoComplete
augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#sources#omni#functions = {'r': 'CompleteR'}
let g:neocomplete#sources#omni#input_patterns = {'r': '[[:alnum:].\\]\+'}
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#sources#buffer#cache_limit_size = 500000
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#enable_refresh_always = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" Nvim-R
let R_in_buffer = 0
let R_tmux_split = 1
let R_args_in_stline = 1
augroup filetype_R
    autocmd!
    autocmd BufRead,BufNewFile *.R nmap <Space> <LocalLeader>l<Enter>
    autocmd BufRead,BufNewFile *.Rnw nmap <Space> <LocalLeader>l<Enter>
    autocmd BufRead,BufNewFile *.Rnw nmap <F2> <LocalLeader>kp
    autocmd BufRead,BufNewFile *.Rnw nmap <F3> <LocalLeader>op
    autocmd BufRead,BufNewFile *.Rnw nmap <LocalLeader>rf <Plug>RStart
augroup END
" }}}

" latex settings - vim-latex {{{
let g:Tex_ViewRule_pdf = 'zathura'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_SmartKeyDot=0
augroup filetype_tex
    autocmd BufRead,BufNewFile *.tex map <F2> <Esc>:w<Enter><leader>ll<Return>
    autocmd BufRead,BufNewFile *.tex map <F4> <Esc><leader>ll<Return>:<C-U>exec '!biber '.Tex_GetMainFileName(':p:t:r')<CR><leader>ll<Return>
    autocmd BufRead,BufNewFile *.tex map <F3> <leader>lv
augroup END
" }}}

" python settings - python-mode {{{
" python-mode
let g:pymode_python = 'python3'
let g:pymode_rope_completion = 0  " use YouCompleteMe instead
augroup filetype_python
    "map <F5> <Esc><leader>r
    autocmd BufRead,BufNewFile *.py nmap <F5> :exec 'w !python3'<cr>
    " screen (for python)
    autocmd BufRead,BufNewFile *.py nmap <F2> :ScreenShell ipython<Return>
    autocmd BufRead,BufNewFile *.py nmap <Space> V:ScreenSend<Return>j
augroup END
" }}}

" vimscript settings ------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" various plugins {{{
" vim-airline (powerline) 
let g:airline_powerline_fonts = 1
set laststatus=2  " always show status line
let g:airline_theme='laederon'

" gitgutter
set updatetime=250
let g:gitgutter_max_signs = 500  " default value

" NERDtree 
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']  " ignore .pyc files
augroup nertree
    autocmd!
    " close NERDtree if it is the only pane opened
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" rainbow (parentheses)
let g:rainbow_active = 1 

" csv
let g:csv_autocmd_arrange = 1
" }}}
