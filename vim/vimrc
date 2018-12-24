""" MAIN {{{
" for when using elsewhere
set fsync backspace=indent,eol,start
set updatetime=290
if &modifiable
	set encoding=utf-8 fileencoding=utf-8
	set fileformat=unix
endif
set incsearch nohlsearch ignorecase smartcase
set shell=zsh
set foldmethod=marker
set list
set wildmenu
set wildcharm=<C-f>

set number relativenumber numberwidth=2
set splitright splitbelow
set mouse=a mousefocus
set clipboard^=unnamedplus
set smarttab autoindent copyindent
set scrolloff=4  " 4 lines of context when scrolling

set ambiwidth=single
set showbreak=↪\ "
set listchars=tab:¦\ ,precedes:←,extends:→,nbsp:‡,trail:·,eol:¬
" default tab->2 spaces, use multiples of 2 when autoindenting
set tabstop=2 shiftwidth=2 shiftround
" wrap shiz
set linebreak nowrap
set whichwrap=b,s,~
set autoread nospell
set virtualedit=block
" set iskeyword-=_
if !isdirectory(expand('$HOME/.cache/vim'))
	call mkdir(expand('$HOME/.cache/vim'))
endif
set directory=~/.cache/vim/tmp
set undofile undodir=~/.cache/vim/undo
if !has('nvim')
	set viminfofile=~/.cache/vim/viminfo
	set viminfo=%10,\"50,'100,'0
endif
set history=1000 undolevels=1000 updatecount=100
set timeoutlen=700 ttimeoutlen=10
syntax enable
filetype indent plugin on
set showmode showcmd
set noerrorbells visualbell
" set autochdir
set formatoptions=roqn21j
let mapleader=' '
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
endif
" completion via mucomplete/ale
set complete=.,w,kspell,k,d,t,i
set completeopt=noinsert,menuone,noselect,preview
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic

if has('win32')
	set runtimepath+=~/.vim
endif
" }}}
""" PLUGINS {{{
" disable some built-in plugins
let g:loaded_2html_plugin = 1
" let g:loaded_netrwPlugin = '000'
let g:loaded_getscriptPlugin = 1
let g:loaded_logipat = 1
" let g:loaded_matchparen = 1
let g:loaded_vimballPlugin = 1
packadd! matchit

" install vim-plug if it's not already there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/uggplug')
" docs
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/goyo.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'fcpg/vim-waikiki'
			let maplocalleader = ','
			let g:waikiki_roots = ['~/notes/']
			let g:waikiki_default_maps = 1
			let g:waikiki_mkdir_prompt = 1
			let g:waikiki_done = '✘'
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'

Plug 'mhinz/vim-startify'
Plug 'simnalamburt/vim-mundo'
Plug 'osyo-manga/vim-over'
" Plug 'kien/rainbow_parentheses.vim'

" colorschemes
Plug 'morhetz/gruvbox'
Plug 'mkarmona/materialbox'
Plug 'nerdypepper/agila.vim'

" completion + linters
Plug 'w0rp/ale'
Plug 'lifepillar/vim-mucomplete'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'LnL7/vim-nix'

" LSP
" if !has('nvim')
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
" Plug 'haskell/haskell-ide-engine'

Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

Plug 'chrisbra/colorizer'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-apathy'

Plug 'johngrib/vim-game-snake'

call plug#end() "}}}
""" VISUALS {{{

set laststatus=2 showtabline=1
set shortmess=filnrxtWc
set fillchars=vert:│
set conceallevel=2
set termguicolors
" tmux specific
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" highlight trailing whitespace
match Error '\s\+$'
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

if has('gui_running')
	set guioptions='PAciMg'  " remove cruft
	set guifont=League\ Mono\ 13,Hasklig\ 13
	set guipty
	execute 'set background=' . ((strftime('%H') % 20) > 7 ? 'light' : 'dark')
	colorscheme agila
	" let g:gruvbox_italic = 1
	" let g:gruvbox_contrast_dark='oft'
	" let g:gruvbox_guisp_fallback='fg'
	" let g:gruvbox_termcolors=256
elseif &termguicolors == 1
	execute 'set background=' . ((strftime('%H') % 22) > 7 ? 'light' : 'dark')
  " set background=light
  colorscheme materialbox
else
	colorscheme elflord
endif

set wildignore+=*.swp,*.swo,*lock,._*
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
set wildignore+=*.avi,*.div,*.mp4,*.webm,*.mkv,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.alac,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.docx,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.o,*.a,a.out,unit_tests,*.pyc,*.gcda,*.gcno

" block in normal mode
" I-beam in insert
" Underline in replace
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" I'm not even using the gooey
set guicursor=a:block
" " mode aware cursors
set guicursor+=o:hor50-Cursor
set guicursor+=n:Cursor
set guicursor+=i-ci-sm:InsertCursor
set guicursor+=r-cr:ReplaceCursor-hor20
set guicursor+=c:CommandCursor
set guicursor+=v-ve:VisualCursor

" set gcr+=a:blinkon0

" hi InsertCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=37  guibg=#2aa198
" hi VisualCursor  ctermfg=15 guifg=#fdf6e3 ctermbg=125 guibg=#d33682
" hi ReplaceCursor ctermfg=15 guifg=#fdf6e3 ctermbg=65  guibg=#dc322f
" hi CommandCursor ctermfg=15 guifg=#fdf6e3 ctermbg=166 guibg=#cb4b16
" }}}
" Autocommands TODO {{{
augroup main
	autocmd!

	" pandoc really needs this
	autocmd ColorScheme highlight default link Conceal Special
	autocmd BufWinEnter * match Error '\s\+$'
	" autocmd BufWinEnter * match Error '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

	autocmd QuickFixCmdPost *grep* cwindow
	" open QFix window if makeprg has errors
	autocmd QuickFixCmdPost [^l]* cwindow

	" autocmd FilterWritePre * if &diff | map <leader>{ :diffget LOCAL<cr> | endif
	" autocmd FilterWritePre * if &diff | map <leader>} :diffget REMOTE<cr>| endif
	" autocmd FilterWritePre * if &diff | map <leader>\| :diffget BASE<cr> | endif

augroup end
" }}}
