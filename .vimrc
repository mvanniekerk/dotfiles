set nocompatible              " be iMproved, required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" my favourite colorscheme
Plugin 'Lokaltog/vim-distinguished'

Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'easymotion/vim-easymotion'

Plugin 'davidhalter/jedi-vim'

Plugin 'oplatek/Conque-Shell'

Plugin 'vim-scripts/haskell.vim'

Plugin 'ElmCast/elm-vim'

Plugin 'adimit/prolog.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
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

" set tabspace of 2 for text files
autocmd Filetype tex setlocal ts=2 sts=2 sw=2

" Settings for NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { "mode": "active"}
let g:elm_syntastic_show_warnings = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

let mapleader=","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo, so
" that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" CTRL-W is very incovenient to type so to switch windows 
" it is remapped to just CTRL-<hjkl> 
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

"if !has("gui_running")
  "set term=xterm
  "set t_Co=256
  "let &t_AB="\e[48;5;%dm"
  "let &t_AF="\e[38;5;%dm"
"endif

colorscheme distinguished

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

"from here on it's python stuff

"enable syntax highlighting
syntax enable

" show line numbers
set number
set relativenumber
"

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab


" set tabs to have 4 spaces
set ts=2
autocmd FileType python set ts=4

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=2
autocmd FileType python set shiftwidth=4

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" show a visual line under the cursor's current line 
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" set higlight color for comments to light blue
"highlight comment ctermfg=lightblue

"set backupdir=~/.vim/tmp,.
"set directory=~/.vim/tmp,.

"use jk as an alternative version of escape
imap jk <esc>

set undofile   " Maintain undo history between sessions
set undodir=~/.vim/undodir
