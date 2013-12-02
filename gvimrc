color phd
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set modelines=0
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile
let mapleader = ","
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
set wrap
set textwidth=79
set formatoptions=qrn1
set listchars=tab:▸\ ,eol:¬
au FocusLost * :wa
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack
nnoremap <leader>q gqip
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e ~/.gvimrc<cr>
inoremap jj <ESC>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
	let &l:sts = l:tabstop
	let &l:ts = l:tabstop
	let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
	echohl ModeMsg
	echon 'tabstop='.&l:ts
	echon ' shiftwidth='.&l:sw
	echon ' softtabstop='.&l:sts
	if &l:et
	  echon ' expandtab'
	else
	  echon ' noexpandtab'
	endif
  finally
	echohl None
  endtry
endfunction

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .gvimrc source ~/.gvimrc
endif

set formatprg=par

command! -nargs=* Wrap set wrap linebreak nolist

vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^
set wrap
set formatoptions=qrn1
