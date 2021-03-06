syntax on
filetype plugin indent on
set encoding=utf-8
set clipboard=unnamedplus

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
" notes with ctrl+b
nnoremap <C-b> :vsplit note:org<CR>
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>q :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>

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
" R settings - Nvim-R {{{
" Nvim-R
tnoremap <C-h> <C-w>w
tnoremap <C-j> <C-w>w
tnoremap <C-k> <C-w>w
tnoremap <leader>l <C-w>:bnext<CR>
" if tmux is on, use tmux
if system("tmux info | wc -l") > 0
    let R_in_buffer = 0
    let R_tmux_split = 1
    let R_args_in_stline = 1
endif
let R_close_term = 1
let R_assign = 0
augroup filetype_R
    autocmd!
    autocmd FileType r nmap <buffer> <Space> <LocalLeader>l<Enter>
    autocmd FileType r nmap <buffer> <F2> <LocalLeader>rf
    autocmd FileType r nmap <buffer> <LocalLeader>h <LocalLeader>rh
    autocmd FileType r nmap <buffer> <LocalLeader>v <LocalLeader>rv
    autocmd FileType r nmap <buffer> <F5> <LocalLeader>aa
    autocmd FileType r nmap <buffer> <F10> :!clear; Rscript -e "testthat::test_dir('tests')"<CR>
    autocmd BufRead,BufNewFile *.Rnw nmap <Space> <LocalLeader>l<Enter>
    autocmd BufRead,BufNewFile *.Rnw nmap <LocalLeader>rf <Plug>RStart
    autocmd BufRead,BufNewFile *.Rnw nmap <F2> <LocalLeader>kp
    autocmd BufRead,BufNewFile *.Rnw nmap <F3> <LocalLeader>op
    autocmd BufRead,BufNewFile *.Rmd nmap <Space> <LocalLeader>l<Enter>
    autocmd BufRead,BufNewFile *.Rmd nmap <F2> <LocalLeader>rf
    autocmd BufRead,BufNewFile *.Rmd nmap <F5> <LocalLeader>kh
    let R_openhtml = 1
    " abbreviations
    function! Eatchar(pat)
        let c = nr2char(getchar(0))
        return (c =~ a:pat) ? '' : c
    endfunc
    autocmd FileType r iabbrev <silent> if if () {<CR><TAB><CR>}<Esc>kkwa<C-R>=Eatchar('\s')<CR>
    autocmd FileType r iabbrev <silent> for for () {<CR><TAB><CR>}<Esc>kk$ba<C-R>=Eatchar('\s')<CR>
    autocmd FileType r iabbrev <silent> function function() {<CR><TAB><CR>}<Esc>kk$hhi<C-R>=Eatchar('\s')<CR>
    " folds
    function! RFolds()
        let thisline = getline(v:lnum)
        if match(thisline, "# .\\+ ----") >= 0
            return ">1"
        elseif match(thisline, "## .\\+ ---") >= 0
            return ">2"
        else 
            return "="
        endif
    endfunc
    autocmd FileType r setlocal foldmethod=expr
    autocmd FileType r setlocal foldexpr=RFolds()
    autocmd FileType r setlocal softtabstop=0 expandtab shiftwidth=2 smarttab
    " tags
    " if filereadable("~/.cache/Nvim-R/RTAGS")
        autocmd FileType r set tags+=~/.cache/Nvim-R/Rtags,~/.cache/Nvim-R/RsrcTags
        autocmd FileType rnoweb set tags+=~/.cache/Nvim-R/Rtags,~/.cache/Nvim-R/RsrcTags
    " endif
    function! MyRBuildTags()
        if filereadable("etags")
            call RWarningMsg('The file "etags" exists. Please, delete it and try again.')
            return
        endif
        call g:SendCmdToR('rtags(ofile = "etags", recursive = TRUE); etags2ctags("etags", "tags"); unlink("etags")')
    endfunction
    autocmd FileType r nmap <buffer> <F4> :call MyRBuildTags()<CR>

augroup END
" }}}
" latex settings - vim-latex {{{
" let g:Tex_ViewRule_pdf = 'zathura'
" let g:Tex_DefaultTargetFormat = 'pdf'
" let g:Tex_SmartKeyDot=0
" augroup filetype_tex
"     autocmd!
"     autocmd FileType tex NeoCompleteLock    
"     autocmd FileType tex setlocal foldlevel=1
"     autocmd BufRead,BufNewFile *.tex map <F2> <Esc>:w<Enter><leader>ll<Return>
"     autocmd BufRead,BufNewFile *.tex map <F4> <Esc><leader>ll<Return>:<C-U>exec '!bibtex '.Tex_GetMainFileName(':p:t:r')<CR><leader>ll<Return>
"     autocmd BufRead,BufNewFile *.tex map <F3> <leader>lv
" augroup END
" }}}
" python settings {{{
augroup filetype_python
    autocmd!
    " ale
    let g:ale_python_pylint_executable = 'python3'
    " python-mode
    autocmd FileType python nmap <F5> <Esc><leader>r
    let g:pymode_folding = 0
    let g:python_syntax_all = 1
    " screen (for python)
    let g:slimux_select_from_current_window = 1
    function! SetupSlimux()
        ScreenShell ipython3
        SlimuxGlobalConfigure
    endfunc
    "autocmd FileType python nmap <F2> :VimuxRunCommand("ipython3")<CR>
    autocmd FileType python nmap <F2> :call term_start("ipython3", {"term_name":"python"})<Return>
    autocmd FileType python nmap <F3> :Codi python<Return>
    autocmd FileType python nmap <F4> :!ctags -R .<Return>

    let g:VimuxOrientation = "h"
    let g:VimuxHeight = "40"
    let g:VimuxResetSequence = "C-a"
    
    function! PythonSend()
        let current_line = getline('.')
        if current_line == "" 
            while current_line == ""
                if line('.') == line('$')
                    break
                endif
                exec "normal! j0"
                let current_line = getline('.')
            endwhile
        else
            let indent = len(substitute(current_line, "[a-zA-Z].*", "", ""))
            call term_sendkeys("python", current_line)
            exec "normal! j0"
            let current_line = getline('.')
            let indent_next = len(substitute(current_line, "[a-zA-Z].*", "", ""))
            let is_send = 0
            while indent_next != indent || current_line == ""
                if current_line != ""
                    call term_sendkeys("python", current_line)
                endif
                if line('.') == line('$')
                    break
                endif
                exec "normal! j0"
                let current_line = getline('.')
                if current_line != ""
                    let indent_next = len(substitute(current_line, "[a-zA-Z].*", "", ""))
                    let is_send = 1
                endif
            endwhile
            if is_send
                call term_sendkeys("python", "\<c-m>")
            endif
            while current_line == ""
                if line('.') == line('$')
                    break
                endif
                exec "normal! j0"
                let current_line = getline('.')
            endwhile
        endif
    endfunc
    autocmd FileType python nmap <space> :call PythonSend()<CR>
    " default ale setting is python3
    let g:ale_python_flake8_executable = 'python'
    let g:ale_python_flake8_options = '-m flake8'     
augroup END
" }}}
" sql settings - dbext.vim {{{
let g:dbext_default_history_file = $HOME . '/.dbext_sql_history'
let g:dbext_default_window_width = 60
let g:dbext_default_window_height = 60

function! Choose_profile(profile_number)
    let g:dbext_default_profile_ds3 = 'type=mysql:extra=--defaults-file='.$HOME.'/pass/dbext/prophet_ds3 -t'
    let s:dbext_profiles = ['ds3']
    let l:exec_string = ':DBSetOption profile=' . s:dbext_profiles[a:profile_number]
    echo s:dbext_profiles[a:profile_number]
    execute l:exec_string
endfunction
nnoremap <F2> :call Choose_profile(0)<CR>

autocmd FileType sql nmap <buffer> <space> <leader>sel
autocmd FileType sql vmap <buffer> <space> <leader>se
autocmd FileType sql nmap <buffer> <localleader>c viW<leader>sdt
" }}}
" vimscript settings ------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim setlocal foldlevel=0
augroup END
" }}}
" C settings - c.vim ------------------{{{
augroup c_settings
    autocmd BufRead,BufNewFile *.c nmap <F6> <LocalLeader>rc
    autocmd BufRead,BufNewFile *.c nmap <F5> <LocalLeader>rr
augroup END
" }}}
" scala settings ------------------{{{
autocmd FileType scala nmap <F2> :VimuxRunCommand("scala")<CR>
function! ScalaSend()
    VimuxRunCommand(getline('.'))
    exec "normal! j0"
endfunc
autocmd FileType scala nmap <space> :call ScalaSend()<CR>
" }}}
" various plugins {{{
" vim-airline (powerline) 
let g:airline_powerline_fonts = 1
set laststatus=2  " always show status line
let g:airline_theme='laederon'
let g:airline#extensions#tabline#enabled = 1

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
autocmd BufRead,BufNewFile *.csv nnoremap <LocalLeader>a <Esc>ggVG:ArrangeColumn<CR>

" neocomplete.vim
autocmd FileType python NeoCompleteLock
let g:neocomplete#enable_at_startup = 1 
let g:neocomplete#sources#omni#functions = {'r': 'CompleteR'}
let g:neocomplete#sources#omni#input_patterns = {'r': '[[:alnum:].\\]\+'}
" start_length doesn't work: change min_pattern_length from 0 to 3 in all files 
" in bundle/neocomplete
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#sources#buffer#cache_limit_size = 500000
let g:neocomplete#enable_fuzzy_completion = 0
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#manual_completion_start_length = 4
inoremap <expr><Tab>  neocomplete#start_manual_complete()
let g:neocomplete#auto_complete_delay = 50
autocmd! FileType python setlocal omnifunc=pythoncomplete#Complete
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" undotree
noremap <c-z> :UndotreeToggle<CR>

" vim-fugitive
noremap <C-g> :Gstatus<CR><C-w>20+

" indentLine
let g:indentLine_color_term = 235

" vim-localvimrc
let g:localvimrc_file_directory_only = 1
let g:localvimrc_whitelist = '/home/tomek/nauka/R/build/.lvimrc'
let g:localvimrc_sandbox = 0

" }}}

let g:instant_markdown_autostart = 0
