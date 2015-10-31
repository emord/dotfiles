set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

"vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'simnalamburt/vim-mundo'
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

Plug 'taglist.vim'
Plug 'python.vim', { 'for': 'python' }

Plug 'irrationalistic/vim-tasks'
Plug 'terryma/vim-expand-region'

Plug 'shuber/vim-promiscuous'

call plug#end()

" Enable file type detection
filetype plugin indent on
syntax enable

set lazyredraw " redraw only when necessary

" NERDTree fix directory opening
let g:NERDTreeDirArrows=0

set modelines=1

"spell checking
set spell spelllang=en_us

"search looks for matches while typing and highlights the matches
set incsearch
set hlsearch
set ignorecase
set smartcase
set showmatch " highlight matching [{()}]

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

let g:neomake_python_pylint_exe = '~/.virtualenvs/commcare-hq/bin/pylint'
" let g:neomake_open_list = 1

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

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize

" vim:foldmethod=marker:foldlevel=0
