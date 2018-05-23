"paste with proper indentation
nnoremap p ]p
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
set whichwrap+=<,>,[,] " after reaching line end, move to next/prev line, except for h and l
" gj and gk that work with rnu
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
" map <Down> gj
" map <Up>   gk
map <Home> g^
map <End>  g$
" tmux has weird escape codes
" vnoremap [1;5C w
" vnoremap [1;5D b
" nnoremap [1;5C w
" nnoremap [1;5D b

noremap <M-j> <C-W><C-j>
noremap <M-k> <C-W><C-k>
noremap <M-l> <C-W><C-l>
noremap <M-h> <C-W><C-h>

nnoremap <Up>    :resize +3<CR>
nnoremap <Down>  :resize -3<CR>
nnoremap <Left>  :vertical resize -3<CR>
nnoremap <Right> :vertical resize +3<CR>

nmap ss ysiw
nmap sS ysiW
nnoremap <silent><leader><leader> :w<cr>

nnoremap <F1> <Esc>
inoremap <F1> <Esc>
if exists(':MundoToggle')
  nnoremap <F2> :MundoToggle<CR>
  inoremap <F2> <Esc>:MundoToggle<CR>
endif
nnoremap <F3> :set list!<CR>
inoremap <F3> <Esc>:set list!<CR>
if exists(':MinimapToggle')
  nnoremap <F4> :MinimapToggle<CR>
  inoremap <F4> <Esc>:MinimapToggle<CR>
endif

if exists(':Goyo')
  nnoremap <F9> :ColorToggle<CR>
  inoremap <F9> <Esc>:ColorToggle<CR>
endif
if exists(':ColorToggle')
  nnoremap <F10> :ColorToggle<CR>
  inoremap <F10> <Esc>:ColorToggle<CR>
endif

nnoremap <silent> <Leader>w :call ToggleWrap()<CR>
" nnoremap <silent> <Leader>s :call TrimSpaces()<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap H gT
nnoremap L gt
