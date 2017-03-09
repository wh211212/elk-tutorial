if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

" Use Unix as the standard file type  
set ffs=unix,dos,mac  

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

"--------------------------------------------------------------------------------
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
filetype plugin indent on           " enable filetype dectection and ft specific plugin/indent
set shortmess=atI
set nobackup
set nowb
set noswapfile
set paste
set mouse-=a
set selection=exclusive
set selectmode=mouse,key
set noerrorbells
"--------------------------------------------------------------------------------
" editor settings
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
"set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
"set number                                                        " show line numbers
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
"--------------------------------------------------------------------------------
" 代码折叠  
set foldenable  
" 折叠方法  
" manual    手工折叠  
" indent    使用缩进表示折叠  
" expr      使用表达式定义折叠  
" syntax    使用语法定义折叠  
" diff      对没有更改的文本进行折叠  
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}  
set foldmethod=syntax  
" 在左侧显示折叠的层次  
set foldcolumn=2  
" set autoindent  
set tabstop=2                " 设置Tab键的宽度        [等同的空格个数]  
set shiftwidth=2  
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]  
set shiftround
" 按退格键时可以一次删掉 4 个空格  
set softtabstop=2  
  
set si "Smart indet
"--------------------------------------------------------------------------------
"colorscheme desert
"colorscheme darkblue
set bg=dark

"--------------------------------------------------------------------------------
" 如遇Unicode值大于255的文本，不必等到空格再折行。  
set formatoptions+=m  
" 合并两行中文时，不在中间加空格：  
set formatoptions+=B

set wildmenu
set magic                        " For regular expressions turn magic on  

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif
"------------------------------------------------------------------------------------------
"                  Filetype settings
"------------------------------------------------------------------------------------------
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

"---------------------------------------------------------------------------------------------------------------------------------------------------
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "If the file type is.Sh
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."), "\##########################################################################")
        call append(line(".")+1, "\# Script Name: ".expand("%"))
        call append(line(".")+2, "\# Author: shaon")
        call append(line(".")+3, "\# Email: shaonbean@qq.com")
        call append(line(".")+4, "\# Created Time: ".strftime("%c"))
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "\# Blog address: http://blog.csdn.net/wh211212") 
        call append(line(".")+7, "\#########################################################################") 
        call append(line(".")+8, "\# Functions:  #") 
        call append(line(".")+9, "\# ") 
        call append(line(".")+10, "\# Define some variables:  #") 
    endif
    "If the file type is.py
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc

"---------------------------------------------------------------------------------------------------------------------------------------------------
"---------------------------------------------------------------------------------------------------------------------------------------------------

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on                          " enable syntax hightlight and completion
  set hlsearch
" highlight current line
  au WinLeave * set nocursorline nocursorcolumn
  au WinEnter * set cursorline cursorcolumn
  set cursorline cursorcolumn
" search
  set incsearch
  "set highlight 	" conflict with highlight current line
  set ignorecase
  set smartcase
endif

filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
