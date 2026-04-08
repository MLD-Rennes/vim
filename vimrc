" Dr. G.Clavier wonderful vimrc file
" General options {{{
    set encoding=utf-8
    " My colorset
    colorscheme everforest
    " colorscheme nord
    syntax on
    " Options I like
    " Wrap lines
    set wrap
    set showcmd
    set cursorline
    set wildmenu
    set showmatch
    set incsearch
    set hlsearch
    " Changes default split behaviour
    set splitbelow splitright
    " Makes all character visible. A bit annoying but useful sometimes
    set listchars=nbsp:¬,eol:$,tab:>-,extends:»,precedes:«,trail:-
    set list
    " Indent
    filetype plugin indent on
    set ruler
    " Indent without fucking tabs
    set tabstop=4
    set shiftwidth=4
    set expandtab
    " Display relative line number
    set number relativenumber
    set colorcolumn=80
    highlight ColorColumn ctermbg=darkgrey
    " Starts line with new comments below comment line
    " Only in insert mode
    set formatoptions+=cr
" }}}

" I stole this from someone
" Check :help statusline for fields meanings
" You can define specific statusline using groups
" and autocommands (see below)
" #STUFF# commands are bg colours
" see :help statusline for other options
" Statusline {{{
    set statusline=
    set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
    set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
    set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ REPLACE\ ':''}
    set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
    set statusline+=\ \%n\          " buffer number
    set statusline+=%#Visual#
    set statusline+=%{&paste?'\ PASTE\ ':''}
    set statusline+=%{&spell?'\ SPELL\ ':''}
    set statusline+=%#CursorIM#
    set statusline+=%= " Add to the right side
    set statusline+=%#CursorLine#
    set statusline+=\ %Y\  " File type
    set statusline+=%#CursorIM#
    set statusline+=\ %3l:%-2c\  " line + column
    set statusline+=%#Cursor#
    set statusline+=\ %3p%%\  " percentage
    set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
    set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
    set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ REPLACE\ ':''}
    set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
    " Display statusline always
    set laststatus=2
" }}}

" Some notes on remapping:
" 1) ALWAYS USE the *noremap variant. Else keys are interpreted as remapped.
"    You don't want that. No one does.
" 2) nnoremap is for normal mode, vnoremap for visual, i... for insert mode,
"    o... is for operator pending operation. Example:
"    'onoremap p i(' <- will interpret dp as di( (delete inside parentheses)
" 3) 'let mapleader' let's you define a special key with name <leader> in
"    commands, you can also define <localleader> with 'let maplocalleader'
" 4) Here is a list of all non-printable characters of Vim you can use.
"    They are case insensitive:
"    <BS>           Backspace
"    <Tab>          Tab
"    <CR>           Enter
"    <Enter>        Enter
"    <Return>       Enter
"    <Esc>          Escape
"    <Space>        Space
"    <Up>           Up arrow
"    <Down>         Down arrow
"    <Left>         Left arrow
"    <Right>        Right arrow
"    <F1> - <F12>   Function keys 1 to 12
"    #1, #2..#9,#0  Function keys F1 to F9, F10
"    <Insert>       Insert
"    <Del>          Delete
"    <Home>         Home
"    <End>          End
"    <PageUp>       Page-Up
"    <PageDown>     Page-Down
"    <bar>          the '|' character, which otherwise needs to be escaped '\|'
" 5) You can use some Vim's commands like /<pattern> to go directly to
"    <pattern>. For example:
"    'onoremap b /return<cr>' <- will operate on all the texte until it finds 'return'

" Remapping {{{
    " Smart remapping starts here
    let mapleader = "\<Space>"
    " I finished Dark Souls 1, 2 AND 3.
    " I play Vim the hardcore way
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <right> <nop>
    nnoremap <left> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <right> <nop>
    inoremap <left> <nop>
    inoremap <esc> <nop>
    vnoremap <up> <nop>
    vnoremap <down> <nop>
    vnoremap <right> <nop>
    vnoremap <left> <nop>
    " People suck but I still want to
    " be able to go out of Vim's insert mode
    " at some points in order to eat and sleep.
    inoremap jk <esc>
    vnoremap jk <esc>
    " Edit and source .vimrc
    nnoremap <leader>ev :split $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
    " Surround word by ' or " in normal mode
    nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
    nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
    " Surround visually selected region by ' or " in visual mode
    vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
    vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
    " Show trailing whitespaces
    nnoremap <leader>w :match Error /\v +$/<cr>
    nnoremap <leader>W :%s/\v +$//g<cr>
    " Ensure search uses very magic mode
    nnoremap / /\v
    " THE LONG AWAITED STOP THIS GODDAMM HILIGHTSEARCH COMMAND
    nnoremap <leader>/ :nohlsearch<cr>
    nnoremap <leader>t :NERDTreeToggle<CR>
" }}}

" Open nerdtree
" autocmd vimenter * NERDTree

" This sign and below group allows folding on markers for vim files.
" This might become handy in order to navigate the vim
" configuration files.
" Vim config group {{{
augroup filetype_vim
    autocmd!
    " Just a simple trick to comment my wonderful .vimrc
    autocmd FileType vim     nnoremap <buffer> <leader>c ^i"<Space><esc>
    " Sets fold method to markers
    autocmd FileType vim     setlocal foldmethod=marker
    " Folds vimfiles when opened
    autocmd FileType vim     set foldlevelstart=0
augroup END
" }}}

" Get my templates for usual formats
" Newfiles template loading {{{
augroup new_file
    autocmd!
    autocmd BufNewFile *.f90 0r /home/$USER/.vim/template.f90
    autocmd BufNewFile *.py  0r /home/$USER/.vim/template.py
    autocmd BufNewFile *.tex 0r /home/$USER/.vim/template.tex
    autocmd BufNewFile *.sh  0r /home/$USER/.vim/template.sh
    autocmd BufNewFile *.ms  0r /home/$USER/.vim/template.ms
augroup END
" }}}

" Useful command for my pythonic python coding
" Python config group {{{
augroup filetype_python
    autocmd!
    autocmd FileType python  nnoremap <buffer> <leader>c ^i#<Space><esc>
    autocmd FileType python  nnoremap <buffer> <leader>C :<C-B>silent <C-E>s/^\V# //e<cr>:nohlsearch<cr>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
    autocmd FileType python :iabbrev <buffer> eif elif:<left>
    autocmd FileType python :iabbrev <buffer> eff else:<cr>
    autocmd FileType python  onoremap <buffer> p i(
    autocmd FileType python  onoremap <buffer> inp :<c-u>normal! f(vi(<cr>
    autocmd FileType python  onoremap <buffer> ilp :<c-u>normal! F)vi(<cr>
    autocmd FileType python  onoremap <buffer> b i[
    autocmd FileType python  onoremap <buffer> inb :<c-u>normal! f[vi[<cr>
    autocmd FileType python  onoremap <buffer> ilb :<c-u>normal! F]vi[<cr>
    autocmd FileType python  onoremap <buffer> c i{
    autocmd FileType python  onoremap <buffer> inc :<c-u>normal! f{vi{<cr>
    autocmd FileType python  onoremap <buffer> ilc :<c-u>normal! F}vi{<cr>
    autocmd FileType python  set foldmethod=indent
    autocmd FileType python  set nofoldenable
    autocmd FileType python  nnoremap <buffer> <F9>  :w<cr> :exec '!python' shellescape(@%, 1)<cr>
augroup END
" }}}

" Useful commands for my LaTeXiLaTeX
" TeX config group {{{
augroup filetype_tex
    autocmd!
    " autocmd BufWritePost *.tex execute "!xelatex %" | redraw!
    " autocmd BufWritePost *.tex execute "!pdflatex %" | redraw!
    autocmd FileType tex map <F9> :!pdflatex % <cr> | redraw!
    autocmd FileType tex nnoremap <buffer> <leader>c ^i%<Space><esc>
    autocmd FileType tex inoremap ;b \begin{}<Enter><Enter>\end{}<Up><Up><Right>
    autocmd FileType tex inoremap ;beq \begin{equation}<Enter><Enter>\end{equation}<Up><Up><Right>
    autocmd FileType tex inoremap ;bit \begin{itemize}<Enter>  \item<Enter>  \item<Enter>  \item<Enter>\end{itemize}<Esc>3k$
    autocmd FileType tex inoremap ;bce \begin{center}<Enter><Enter>\end{center}<Up><Up><Right>
    autocmd FileType tex inoremap ;bfi \begin{figure}<Enter><Enter>\end{figure}<Up><Up><Right>
    autocmd FileType tex inoremap \sc \section{}
    autocmd FileType tex inoremap \ssc \subsection{}
    autocmd FileType tex inoremap \sssc \subsubsection{}
    autocmd FileType tex inoremap \int \int
    autocmd FileType tex inoremap \int_ \int_{}^{}<Esc>3hi
    autocmd FileType tex inoremap \frac \frac{}{}<Esc>2hi
augroup END
" }}}

" Same goes for the fortranny fortran
" Fortran config group {{{
augroup filetype_fortran
    autocmd!
    autocmd FileType fortran nnoremap <buffer> <leader>c ^i!<Space><esc>
augroup END
" }}}

" Markdown config group {{{
augroup filetype_md
    autocmd!
    autocmd Filetype markdown onoremap <buffer> ih :<c-u>execute "normal! ?^\[=,-\]\\+$\r:nohlsearch\rkvg_"<cr>
    " Surround word by * or ** in normal mode
    autocmd Filetype markdown nnoremap <leader>** viw<esc>a**<esc>bbi**<esc>lell
    autocmd Filetype markdown nnoremap <leader>* viw<esc>a*<esc>bi*<esc>lel
    " Surround visually selected region by * or ** in visual mode
    autocmd Filetype markdown vnoremap <leader>** <esc>`>a**<esc>`<i**<esc>
    autocmd Filetype markdown vnoremap <leader>* <esc>`>a*<esc>`<i*<esc>
    " Show trailing whitespaces
augroup END
" }}}

" ALE related commands {{{
" Warning message format
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

    " Global fixers
    let g:ale_linters = { 'cpp':  ['cppcheck', 'cpplint', 'gcc'] }
    let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'],
                \        'python': ['black']
                \      }
" }}}

" Personal functions {{{
    function Topots(maxtime,dumptime,dt)
        let nstep = a:maxtime/a:dt
        let ndump = a:dumptime/a:dt
        let timestep = 0
        while l:timestep <= l:nstep
            execute ":normal! A ". l:timestep."\n"
            let temp = l:timestep+1
            execute ":normal! A ". l:temp."\n"
            let timestep += l:ndump
        endwhile
    endfunction
" }}}
