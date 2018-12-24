" delimitMate {{{
if exists('g:loaded_delimitMate')
	let g:delimitMate_nesting_quotes = ['"','`']
	let g:delimitMate_matchpairs = '(:),[:],{:},<:>'
	let g:delimitMate_expand_cr = 1
	let g:delimitMate_expand_space = 1
	let g:delimitMate_jump_expansion = 1
	let g:delimitMate_balance_matchpairs = 1
endif
" }}}
" " Easytags {{{
" " let g:easytags_syntax_keyword = 'always'
" " let g:easytags_file = '~/.cache/vimtags'
" " set tags=./tags;
" " let g:easytags_dynamic_files = 2
" " let g:easytags_events = ['FileReadPre']
" " }}}
" " jedi-vim {{{
" "	let g:jedi#completions_enabled = 0
" " }}}
" mucomplete {{{
if exists('g:loaded_mucomplete')
	" taken from mucomplete docs
	imap <expr> / pumvisible() && strpart(getline('.'), 0, col('.') - 1)  =~# '\f\+/$'
			\ ? "\<c-y>\<plug>(MUcompleteFwd)"
			\ : '/'

	inoremap <expr> <CR> pumvisible() ? "\<c-y>\<cr>" : "\<CR>"
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	let g:mucomplete#spel#max = 15
	let g:clang_complete_auto = 1
	let g:clang_user_options = '-std=c99'
	let g:clang_library_path = '/usr/lib/libclang.so'

	imap <expr> <C-l> mucomplete#extend_fwd("\<C-l>")
	let g:mucomplete#enable_auto_at_startup = 1
	let g:mucomplete#delayed_completion = 0
	let g:mucomplete#spel#max = 8
	let g:mucomplete#chains = {}
	let g:mucomplete#chains.default = ['omni',  'c-p', 'defs', 'path', 'incl', 'tags', 'dict', 'uspl',]
	let g:mucomplete#chains.vim = ['cmd', 'path', 'keyn']
	" let g:mucomplete#can_complete = { 'c' : { 'omni': {t -> t =~# '\%(->\|::\|\.\)$'} } }
endif
" }}}
" Mundo (fork of gundo) {{{
if exists('g:loaded_mundo')
	let g:mundo_preview_height = 10
	let g:mundo_width = 23
	let g:mundo_preview_bottom = 1
endif
" }}}
" Pandoc {{{
if exists('g:loaded_pandoc')
	let g:pandoc#filetypes#handled = ['markdown','rst','latex']
	let g:pandoc#modules#disabled = ['keyboard']
	let g:pandoc#formatting#mode = 's'
	let g:pandoc#spell#enabled = 0
	let g:pandoc#folding#mode = 'syntax'
	let g:pandoc#folding#fold_yaml = 1
	let g:pandoc#folding#fdc = 0
endif
" }}}
" Startify {{{
if exists('g:loaded_startify')
	let g:startify_list_order = [
					\ ['     ### MRU'],      'files',
					\ ['     ## Bookmarks'], 'bookmarks',
					\ ['     ## Sessions'],  'sessions',
					\ ['     ## Commands'],  'commands' ]
	let g:startify_change_to_dir = 0
	let g:startify_change_to_vcs_root = 1
	let g:startify_fortune_use_unicode = 1
	let g:startify_padding_left = 5
endif
" }}}
" SLIME {{{
if exists('g:loaded_slime')
	let g:slime_target = 'tmux'
	let g:slime_paste_file = '$HOME/.cache/slime_paste'
	let g:slime_python_ipython = 1
endif
" }}}
" TeX {{{
" let g:tex_flavor = 'context'
" let g:vimtex_view_use_temp_files = 1
" let g:vimtex_view_forward_search_on_start = 1
" let g:vimtex_view_zathura_options = 'set recolor=false'
" }}}
