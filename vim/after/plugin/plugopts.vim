" ALE {{{
if exists('g:loaded_ale')
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_set_loclist = 0
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
	let g:ale_completion_enabled = 0
	let g:ale_completion_delay = 0
	let g:ale_completion_max_suggestions = 5
endif
" }}}
" LanguageClient-neovim {{{
if exists('g:loaded')
	let g:LanguageClient_serverCommands = {
			\	'rust':   ['rls'],
			\	'python': ['pyls'],
			\	'c':      ['gcc', 'clangd', 'cquery'],
			\	'cpp':    ['clangd', 'cquery', 'clangcheck'],
			\ }
	let g:LanguageClient_changeThrottle = 1
	let g:LanguageClient_waitOutputTimeout = 4
	let g:LanguageClient_settingsPath = '$MYVIMRC/lclient.json'

	set completefunc=LanguageClient#complete
	set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

	nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
endif
" }}}
" Netrw {{{
if exists('g:loaded_netrwPlugin') && g:loaded_netrwPlugin !=# '000'
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
