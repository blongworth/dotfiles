" vimrc

" don't be vi compatible
set nocompatible
filetype off                  " required
set shell=bash "for sane redirecting with syntastic

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
"let mapleader=","

" PLUGIN MANAGEMENT
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

Bundle 'vim-scripts/Vim-R-plugin'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'reedes/vim-pencil'
Plugin 'mileszs/ack.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax' 

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" turn on syntax hilight
syntax on

" vim-airline config
set laststatus=2
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
let g:airline_powerline_symbols='fancy'
let g:airline_section_x = '%{PencilMode()}'
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
\ [%l/%L\ (%p%%)

" solarized stuff
set t_Co=16
set background=dark
"set background=light
colorscheme solarized
call togglebg#map("<F5>")

"ag stuff
if executable('ag')
  let g:ack_prg = "ag --column"
endif

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za  " Enable folding with the spacebar

" python indent settings
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js, *.html, *.css, *.R, *.Rmd
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  " autocmd FileType text,txt     call pencil#init()
augroup END

highlight BadWhitespace ctermbg = red guibg = darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8

" turn on line numbering
set nu

" YouCompleteMe setup
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim.ack setup
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Make vim-r indent with 2 spaces
" set vim-r-plugin to 
let r_indent_align_args = 0

" Set vim-r-plugin to mimics ess :
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0

" gvim font
set gfn=DejaVu\ Sans\ Mono\ for\ Powerline\ 11

" Control shortcuts
map! jj <ESC>
map! jk <ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
