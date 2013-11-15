set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

"vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'gerw/vim-latex-suite'
Bundle 'flazz/vim-colorschemes'
Bundle 'godlygeek/tabular'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'

Bundle 'python.vim'
"Bundle 'taglist.vim'

syntax on
" Enable file type detection
filetype plugin indent on
"
" NERDTree fix directory opening
let g:NERDTreeDirArrows=0

"spell checking
set spell spelllang=en_us

"search looks for matches while typing and highlights the matches
set incsearch
set hlsearch
set ignorecase
set smartcase

"tabs = 4 spaces and auto indent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent

"after 80 characters new line
set textwidth=80

"line numbers
set number

"latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set t_Co=256
colorscheme zenburn

"escape with jj really quickly
inoremap jj <Esc>

" next/prev window
noremap <Up> <C-w>w
noremap <Down> <C-w>p
" next/prev tab
noremap <Right> gt 
noremap <Left> gT
"NERDTree toggling
nnoremap <F2> :NERDTreeToggle<CR>

set foldmethod=syntax

" keeps the cursor off the bottom
set scrolloff=5

"persistent undo and auto backup
set backup
set backupdir=~/.vim/backups

set swapfile
set dir=~/.vim/swap

set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" better navigation when wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"breaks on whitespace
set wrap linebreak nolist

" can move away from a changed buffer without warning
set hidden

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

" Only do this part when compiled with support for autocommands
" http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
if has("autocmd")
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType scss,html,css,ruby,eruby,javascript,cucumber setlocal ts=2 sts=2 sw=2 expandtab
endif
