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
Bundle 'scrooloose/syntastic'
Bundle 'tomtom/tcomment_vim'
Bundle 'rking/ag.vim'

Bundle 'python.vim'
Bundle 'taglist.vim'

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
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F2> :set hlsearch!<CR>
nnoremap <F4> :TlistToggle<CR>

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

"highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" can move away from a changed buffer without warning
set hidden

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬

" Only do this part when compiled with support for autocommands
" http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
if has("autocmd")
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType scss,html,css,ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript,cucumber,lua setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufWritePre  *.js,*.rb,*.erb,*.cpp,*.h :%s/\s\+$//e
endif

let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_ruby_checkers = ['rubylint']
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_cpp_checkers = ['gcc', 'cpplint']
let g:syntastic_cpp_cpplint_args="--filter=-legal/copyright,-build/header_guard,-readability/streams"
let g:syntastic_cpp_compiler_options ='-Wall -std=c++11'

let g:agprg = 'ag --nogroup --nocolor --column'
