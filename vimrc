set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

"vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'benekastah/neomake', { 'for': ['python', 'javascript', 'json'] }
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'Numkil/ag.nvim'

Plug 'Raimondi/delimitMate'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'junegunn/fzf', { 'do': 'yes \| ./install' }

" Plug 'ludovicchabant/vim-gutentags', {'for': ['python']}

Plug 'taglist.vim'
Plug 'python.vim', { 'for': 'python' }

Plug 'irrationalistic/vim-tasks'
Plug 'terryma/vim-expand-region'

call plug#end()

" Enable file type detection
filetype plugin indent on
syntax on
"
" NERDTree fix directory opening
let g:NERDTreeDirArrows=0

set nomodeline

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

"line numbers
set number

set cursorline

"latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set t_Co=256
colorscheme zenburn

"escape with jj really quickly
inoremap jj <Esc>

" next/prev window
" noremap <Up> <C-w>w
" noremap <Down> <C-w>p
" " next/prev tab
" noremap <Right> gt
" noremap <Left> gT
"NERDTree toggling
nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F2> :set hlsearch!<CR>
nnoremap <F4> :TlistToggle<CR>

set foldmethod=indent

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

"fix backspace
set backspace=indent,eol,start

"highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set colorcolumn=80

" can move away from a changed buffer without warning
set hidden

let mapleader = "\<Space>"

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Only do this part when compiled with support for autocommands
" http://vimcasts.org/episodes/whitespace-preferences-and-filetypes/
if has("autocmd")
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType tsv,xml setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType scss,html,css,ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType cucumber,lua setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType python setlocal foldmethod=indent
  " autocmd BufWritePre  *.js,*.rb,*.erb,*.cpp,*.h,*.py,*c :%s/\s\+$//e
  autocmd! BufWritePost,BufReadPost *.js,*.json Neomake
endif

" let g:gutentags_cache_dir = '.git'
let g:neomake_python_pylint_exe = '~/.virtualenvs/commcare-hq/bin/pylint'
" let g:neomake_open_list = 1

" let g:syntastic_auto_loc_list=0
" let g:syntastic_enable_signs=1
" let g:syntastic_check_on_open=1
" let g:syntastic_haskell_checkers = ['hlint']
"
" let g:syntastic_javascript_checkers = ['jshint']
"
" let g:syntastic_python_checkers = ['python', 'pylint', 'pep8']
" let g:syntastic_python_pylint_exec = '~/.virtualenvs/commcare-hq/bin/pylint'
" let g:syntastic_python_pylint_args = '--load-plugins pylint_django'
" let g:syntastic_python_pep8_args = '--ignore=E501,E128,F403'
"
" let g:syntastic_ruby_checkers = ['rubocop', 'rubylint']
" let g:syntastic_ruby_rubocop_args ='-l'
"
" let g:syntastic_cpp_checkers = ['gcc', 'cppcheck', 'cpplint']
" let g:syntastic_cpp_compiler_options ='-Wall -Wextra -std=c++11'
" let g:syntastic_cpp_cppcheck_args ='--enable=all -j 4'
" let g:syntastic_cpp_cpplint_args="--filter=-legal/copyright,-build/header_guard,-readability/streams"
"
" let g:syntastic_c_checkers = ['gcc', 'cppcheck']
" let g:syntastic_c_compiler_options ='-Wall -Wextra'
" let g:syntastic_c_cppcheck_args ='--enable=all -j 4'


set diffopt+=iwhite

function! s:RemoveMultipleNewlines()
    :%s/\s\+$//e
    :%s/\n\{3,}/\r\r/e
endfunction

command! FixEndings call s:RemoveMultipleNewlines()

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme='bubblegum'

let g:csv_highlight_column = 'y'

nnoremap <Leader>s :Ag 
nnoremap <Leader>t :tselect
nnoremap <C-p>  :FZF<CR>

nnoremap <Leader>w :w<CR>

let g:ag_working_path_mode = 'r'

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
