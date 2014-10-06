set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

"vundle stuff
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'bling/vim-airline'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'

Plugin 'taglist.vim'
Plugin 'python.vim'

call vundle#end()

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

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

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
  autocmd FileType tsv setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType scss,html,css,ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript,cucumber,lua setlocal ts=2 sts=2 sw=2 expandtab
  autocmd BufWritePre  *.js,*.rb,*.erb,*.cpp,*.h,*.py,*c :%s/\s\+$//e
endif

let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1

let g:syntastic_python_checkers = ['python', 'pylint', 'pep8']

let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_ruby_rubocop_args ='-l'

let g:syntastic_cpp_checkers = ['gcc', 'cppcheck', 'cpplint']
let g:syntastic_cpp_compiler_options ='-Wall -Wextra -std=c++11'
let g:syntastic_cpp_cppcheck_args ='--enable=all -j 4'
let g:syntastic_cpp_cpplint_args="--filter=-legal/copyright,-build/header_guard,-readability/streams"

let g:syntastic_c_checkers = ['gcc', 'cppcheck']
let g:syntastic_c_compiler_options ='-Wall -Wextra'
let g:syntastic_c_cppcheck_args ='--enable=all -j 4'

set diffopt+=iwhite

function! s:RemoveMultipleNewlines()
    :%s/\s\+$//e
    :%s/\n\{3,}/\r\r/e
endfunction

command! FixEndings call s:RemoveMultipleNewlines()

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

let g:unite_winheight=10

nnoremap <silent> <Leader>m :Unite -buffer-name=recent file_mru<cr>
nnoremap <Leader>b :Unite -buffer-name=buffers buffer<cr>

" CtrlP search
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')
" replacing unite with ctrl-p
" nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files file_rec/async<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Use ag for search
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '-f --nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

nnoremap <Leader>s :Unite -no-quit -keep-focus grep:.<cr>
nnoremap <Leader>f :Unite -no-quit -keep-focus grep:
