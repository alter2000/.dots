" syntax in code blocks
" from https://www.reddit.com/r/vim/comments/a53dch/template_string_highlighting/
" let g:language_map = {'bash': 'sh'}
" for language in [ 'python', 'bash', 'c', 'rust', 'nix', 'cpp', 'liquid' ]
"     call SyntaxRange#Include('```'.language, '```', get(g:language_map, language, language), 'NonText')
" endfor

let g:markdown_fenced_languages = [
	\	'python', 'bash=sh', 'zsh', 'c', 'cpp', 'liquid',
	\	'css', 'tex']

let readline_has_bash = 1
