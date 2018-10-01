" corrections + misc shiz {{{
" paste with proper indentation
" nnoremap p ]p
" switcharooooooo
nnoremap : ,
nnoremap ; :
nnoremap , ;
vnoremap : ,
vnoremap ; :
vnoremap , ;
set whichwrap+=<,>,[,]
" gj and gk that work with rnu
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap H gT
nnoremap L gt
xnoremap < <gv
xnoremap > >gv
nnoremap vv V
nnoremap V <C-v>
nnoremap Y y$
" tmux has weird escape codes
" vnoremap [1;5C w
" vnoremap [1;5D b
" nnoremap [1;5C w
" nnoremap [1;5D b
" map <Down> gj
" map <Up>   gk
map <Home> g^
map <End>  g$

noremap <C-j> <C-W><C-j>
noremap <C-k> <C-W><C-k>
noremap <C-l> <C-W><C-l>
noremap <C-h> <C-W><C-h>

nnoremap <Up>    :resize +3<CR>
nnoremap <Down>  :resize -3<CR>
nnoremap <Left>  :vertical resize -3<CR>
nnoremap <Right> :vertical resize +3<CR>

function! Joana()
	unmap <Up>
	unmap <Down>
	unmap <Left>
	unmap <Right>
endfunction
command! Joana call Joana()

" Emacs heresy
cnoremap <C-a> <Home>
inoremap <C-a> <Home>
cnoremap <C-e> <End>
inoremap <C-e> <End>
"cnoremap <C-k> 
" }}}

nmap ss ysiw
nmap sS ysiW

" add empty lines up/down
nnoremap <silent> [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[
nnoremap <silent> ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<CR>
nnoremap <silent> <leader><leader> :w<cr>
nnoremap <silent> <leader>w        :call func#toggleWrap()<CR>
" nnoremap <silent> <leader>s        :call func#trimSpaces()<CR>
nnoremap <silent> <leader>s        :setlocal spell!<CR>
" edit macros
nnoremap <silent> <leader>m        :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" function keys {{{
nnoremap <F1> <Esc>
inoremap <F1> <Esc>

if exists(':MundoToggle')
  nnoremap <F2> :MundoToggle<CR>
  inoremap <F2> <Esc>:MundoToggle<CR>
endif

nnoremap <F3> :set list!<CR>
inoremap <F3> <C-o>:set list!<CR>

if exists(':ColorToggle')
  nnoremap <F10> :ColorToggle<CR>
  inoremap <F10> <C-u>:ColorToggle<CR>
endif

if exists(':Goyo')
	nnoremap <F11> :Goyo<CR>
	inoremap <F11> <C-u>:Goyo<CR>
endif
" }}}

" completion
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
