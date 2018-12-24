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
" Mundo (fork of gundo) {{{
if exists('g:loaded_mundo')
	let g:mundo_preview_height = 10
	let g:mundo_width = 23
	let g:mundo_preview_bottom = 1
endif
" }}}
" ALE {{{
if exists('g:loaded_ale')
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_set_loclist = 1
	let g:ale_set_quickfix = 0

	let g:ale_sign_error = '!!'
	let g:ale_sign_warning = '‽‽'
	let g:ale_echo_msg_info_str = 'I'
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%severity%] [%linter%] %s'
	let g:ale_linters = {
		\	'python': ['flake8', 'pylint'],
		\	'c':      ['gcc', 'clangcheck', 'clangd'],
		\	'cpp':    ['clangcheck', 'cquery', 'clangd'],
		\	'rust':   ['rls', 'cargo'],
		\	}
	let g:ale_fixers = {
		\	'python': ['yapf', 'autopep8'],
		\	'c':      ['clang-format'],
		\	'cpp':    ['clang-format'],
		\	'rust':   ['rustfmt'],
		\	}
	let g:ale_c_gcc_options = '-std=c99 -Wall -Wextra'
	let g:ale_completion_enabled = 1
	let g:ale_completion_delay = 0
	let g:ale_completion_max_suggestions = 5
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
" Netrw {{{
if g:loaded_netrwPlugin !=# '000'
	let g:netrw_dav_cmd   = 'cadaver'
	let g:netrw_file_cmd  = 'wget'
	let g:netrw_http_cmd  = 'w3m'
	" let g:netrw_ftp_list_cmd = 'ls -lhF'
	" let g:netrw_ftp_timelist_cmd = 'ls -tlhF'
	" let g:netrw_ftp_sizelist_cmd = 'ls -slhF'

	" 0--same; 1-2--horiz/vert; 3--tab; 4--last switch
	let g:netrw_browse_split = 3
	" 1--timestamp column; 2--horizontal; 3--tree
	let g:netrw_liststyle = 2
	let g:netrw_winsize = 20
	let g:netrw_hide = 1
	let g:netrw_altv = 1
	let g:netrw_keepdir = 0
	let g:netrw_browsex_viewer = 'xdg-open'
endif
" }}}
" TeX {{{
" let g:tex_flavor = 'context'
" let g:vimtex_view_use_temp_files = 1
" let g:vimtex_view_forward_search_on_start = 1
" let g:vimtex_view_zathura_options = 'set recolor=false'
" }}}
" delimitMate {{{
if exists('g:loaded_delimitMate')
	let g:delimitMate_nesting_quotes = ['"','`']
endif
" }}}
" SLIME {{{
if exists('g:loaded_slime')
	let g:slime_target = 'tmux'
	let g:slime_paste_file = '$HOME/.cache/slime_paste'
	let g:slime_python_ipython = 1
endif
" }}}
" Easytags {{{
" let g:easytags_syntax_keyword = 'always'
" let g:easytags_file = '~/.cache/vimtags'
" set tags=./tags;
" let g:easytags_dynamic_files = 2
" let g:easytags_events = ['FileReadPre']
" }}}
" mucomplete {{{
if exists('g:loaded_mucomplete')
	" taken from mucomplete docs
	imap <expr> / pumvisible() && strpart(getline('.'), 0, col('.') - 1)  =~# '\f\+/$'
			\ ? "\<c-y>\<plug>(MUcompleteFwd)"
			\ : '/'

	inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	let g:mucomplete#spel#max = 15

	let g:clang_complete_auto = 1
	let g:clang_user_options = '-std=c99'
	let g:clang_library_path = '/usr/lib/libclang.so'

	let g:mucomplete#enable_auto_at_startup = 1
	let g:mucomplete#delayed_completion = 0
	" let g:mucomplete#chains += {'default': ['omni', 'path', 'incl', 'dict', 'uspl']}
endif
" }}}
" LanguageClient-neovim {{{
let g:LanguageClient_serverCommands = {
		\	'rust':   ['rls'],
		\	'python': ['pyls'],
		\	'c':      ['clangd', 'cquery'],
		\	'cpp':    ['clangcheck', 'cquery', 'clangd'],
		\	'vim':    [],
		\ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
