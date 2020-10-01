let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Compile/run from Vim
autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" Autocomplete brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Defaults
set nocompatible
syntax on
set number
set tabstop=4 shiftwidth=4 expandtab
set ruler
set hlsearch
filetype plugin on
" bash-like TAB completion
" set wildmode=longest,list

" Navigate through completion variants using ← and →
set wildmenu
ca tn tabnew
se mouse+=a
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'javascript']}
Plug 'arcticicestudio/nord-vim'
Plug 'turbio/bracey.vim'
Plug 'itchyny/lightline.vim'
Plug 'jakobkogler/Algorithm-DataStructures'
Plug 'flazz/vim-colorschemes'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf'

" Plug 'preservim/nerdtree'
" Plug 'vim-syntastic/syntastic'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'tomtom/tcomment_vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'tpope/vim-commentary'
" Plug 'jreybert/vimagit'
" Plug 'mileszs/ack.vim'
" Plug 'majutsushi/tagbar'
" Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'
" Plug 'tpope/vim-fugitive'
call plug#end()

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritepre * %s/\n\+\%$//e

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Faster moving
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

set t_Co=256
let g:user_emmet_leader_key=','
colorscheme nord
set updatetime=100
let g:airline_highlighting_cache=1
