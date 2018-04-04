"paste with proper indentation
nnoremap p ]p
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
set whichwrap+=<,>,[,] " after reaching line end, move to next/prev line, except for h and l
map j gj
map k gk
map <Down> gj
map <Up>   gk
map <Home> g^
map <End>  g$
" tmux has weird escape codes
vnoremap [1;5C w
vnoremap [1;5D b
nnoremap [1;5C w
nnoremap [1;5D b

noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

nnoremap <F2>  :GundoToggle<CR>
nnoremap <F3>  :set list!<CR>
nnoremap <F4>  :MinimapToggle<CR>
nnoremap <F10> :ColorHighlight<CR>
inoremap <F2>  <Esc>:GundoToggle<CR>
inoremap <F3>  <Esc>:set list!<CR>
inoremap <F4>  <Esc>:MinimapToggle<CR>
inoremap <F10> <Esc>:ColorHighlight<CR>
nnoremap <silent> <Leader>w :call ToggleWrap()<CR>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap W w !sudo tee > /dev/null %

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap H gT
nnoremap L gt
