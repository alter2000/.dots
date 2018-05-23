""" Pandoc """
let g:pandoc#filetypes#handled = ['markdown','rst','latex']
let g:pandoc#modules#disabled = ['keyboard']
let g:pandoc#formatting#mode = 's'
let g:pandoc#spell#enabled = 0
let g:pandoc#folding#mode = 'syntax'
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#folding#fdc = 0

""" Mundo (fork of gundo) """
let g:mundo_preview_height = 10
let g:mundo_width = 23
let g:mundo_preview_bottom = 1

""" ALE """
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '‽‽'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_format = '[%severity%] [%linter%] %s'
let g:ale_completion_max_suggestions = 15

""" Startify """
let g:startify_list_order = [
				\ ['     ### MRU'],      'files',
				\ ['     ## Bookmarks'], 'bookmarks',
				\ ['     ## Sessions'],  'sessions',
				\ ['     ## Commands'],  'commands' ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 5

""" Netrw """
let g:netrw_dav_cmd   = 'cadaver'
let g:netrw_file_cmd  = 'wget'
let g:netrw_http_cmd  = 'w3m'
let g:netrw_ftp_list_cmd = 'ls -lhF'
let g:netrw_ftp_timelist_cmd = 'ls -tlhF'
let g:netrw_ftp_sizelist_cmd = 'ls -slhF'

let g:netrw_browse_split = 3
let g:netrw_liststyle = 2
let g:netrw_winsize = 40
let g:netrw_hide = 1
let g:netrw_keepdir = 0

""" TeX """
let g:tex_flavor = 'context'
" let g:vimtex_view_use_temp_files = 1
" let g:vimtex_view_forward_search_on_start = 1
" let g:vimtex_view_zathura_options = 'set recolor=false'

let g:delimitMate_nesting_quotes = ['"','`']

" set completeopt=longest,menuone,preview
" set complete=.,w,kspell,k,d,t

""" Easytags """
let g:easytags_syntax_keyword = 'always'
let g:easytags_file = '~/.cache/vimtags'
set tags=./tags;
let g:easytags_dynamic_files = 2
let g:easytags_events = ['FileReadPre']

""" NCM """
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
