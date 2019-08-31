set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'phpactor/phpactor'
Plugin 'stephpy/vim-php-cs-fixer'
call vundle#end()
filetype plugin indent on

map <C-t> :TagbarToggle<CR>

map <C-n> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

colorscheme solarized

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>
" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>
" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>
" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>
" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>
" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

let g:phpactorPhpBin = 'php'
let g:phpactorBranch = 'master'
let g:phpactorOmniAutoClassImport = v:true
let g:phpactorCompletionIgnoreCase = 1
let g:phpactorOmniError = v:true

autocmd FileType php setlocal omnifunc=phpactor#Complete

syntax on
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set scrolloff=5
set number relativenumber
set ruler
set suffixes+=.aux,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.inx,.jpg,.log,.out,.png,.toc
set suffixes-=.h
set suffixes-=.obj
set hlsearch
set ignorecase smartcase
set history=500
set backup
set undolevels=1000
set undoreload=1000
set undofile
set viminfo+=n~/.vim/viminfo
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo

if isdirectory($HOME . '.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
endif
if isdirectory($HOME . '.vim/backup') == 0
    :silent !mkdir -p ~/.vim/backup > /dev/null 2>&1
endif
if isdirectory($HOME . '.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
endif

if has('gui_running')
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
endif
