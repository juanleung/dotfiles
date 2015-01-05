set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Mis Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/emmet-vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jasonlong/lavalamp'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'Yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()
filetype plugin indent on
filetype indent on
syntax on
syntax enable

let mapleader=","

set t_Co=256
set shiftwidth=2
set softtabstop=2
set smarttab
set tabstop=2
set expandtab
set autoindent
set cindent
set showmode
set background=dark
set mouse=a
set cc=80
set number
set nowrap
set hlsearch
set ignorecase
set smartcase
set noswapfile
set encoding=utf-8
set laststatus=2
set lazyredraw
set noshowmode
set binary
set noeol
set ruler
set wildmenu
set cursorline
"set paste
set splitbelow
set splitright
set smartindent
set backspace=2
set backspace=indent,eol,start
set clipboard=unnamed

if exists("&relativenumber")
  set relativenumber
	au BufReadPost * set relativenumber
endif

" Redimensionamiento entre ventanas
nnoremap <c-l> :vertical resize -1<cr>
nnoremap <c-h> :vertical resize +1<cr>
nnoremap <c-j> :resize -1<cr>
nnoremap <c-k> :resize +1<cr>

" Configurando la identación del html
let g:html_indent_inctags="html,body,head,tbody,script"

let g:solarized_termcolors = 256
"let g:solarized_visibility = 'high'
"let g:solarized_contrast = 'high'
colorscheme solarized
" colorscheme darcula
" colorscheme Monokai
" colorscheme Tomorrow-Night-Eighties

" Cambia el cursor según el modo solo para Iterm2
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Cambia el cursor según el modo solo para tmux sobre Iterm2
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeQuitOnOpen=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let g:vimfiler_as_default_explorer = 1

" Copiado desde Janus
augroup AuNERDTreeCmd
autocmd AuNERDTreeCmd VimEnter * call s:CdIfDirectory(argv(0))
autocmd AuNERDTreeCmd FocusGained * call s:UpdateNERDTree()

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

" NERDTree utility function
function s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif
endfunction


" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Powerline
let g:Powerline_symbols = 'fancy'
" Fix Powerline change mode delay
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ["jshint"]
let g:syntastic_jshint_exec='/usr/local/bin/jshint'
let g:syntastic_python_checkers = ['flake8']

" YCM
let g:ycm_autoclose_preview_window_after_completion = 1

" Corre flake8 cada vez que se guarda un archivo python
" autocmd BufWritePost *.py call Flake8()
