" let g:livepreview_previewer = 'zathura'
let g:pandoc#folding#mode = 'relative'
let g:pandoc#folding#fdc = 0

let g:gundo_preview_height = 10
let g:gundo_width = 23
let g:gundo_preview_bottom = 1

let g:startify_list_order = [
				\ ['     ### MRU'],      'files',
				\ ['     ## Bookmarks'], 'bookmarks',
				\ ['     ## Sessions'],  'sessions',
				\ ['     ## Commands'],  'commands' ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 5

let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_detect_spell = 0
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#vimtex#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_a = airline#section#create(['mode','crypt','paste','spell','iminsert'])
let g:airline_section_b = airline#section#create(['hunks','branch'])
let g:airline_section_c = airline#section#create(['%<','file'])
let g:airline_section_gutter = airline#section#create([' %='])
let g:airline_section_x = airline#section#create(['spell','filetype'])
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['|%v  %P'])
let g:promptline_theme = 'airline'
let g:airline_mode_map = {
				\ '__': '-',  'n': 'N',
				\ 'i': 'I',   'R': 'R',
				\ 'c': 'C',   'v': 'V',
				\ 'V': 'VB',  '' : 'V',
				\ 's': 'S',   'S': 'SB', }

let g:netrw_liststyle = 2
let g:netrw_dav_cmd   = 'cadaver'
let g:netrw_file_cmd  = 'wget'
let g:netrw_http_cmd  = 'w3m'
let g:netrw_ftp_list_cmd = 'ls -lhF'
let g:netrw_ftp_timelist_cmd = 'ls -tlhF'
let g:netrw_ftp_sizelist_cmd = 'ls -slhF'
let g:netrw_browse_split = 1
let g:netrw_hide = 1
let g:netrw_keepdir = 0

" let g:vimtex_view_use_temp_files = 1
" let g:vimtex_view_forward_search_on_start = 1
" let g:vimtex_view_zathura_options = 'set recolor=false'

let g:delimitMate_nesting_quotes = ['"','`']

" set completeopt=longest,menuone,preview
" set complete=.,w,kspell,k,d,t
