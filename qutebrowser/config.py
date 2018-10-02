config.load_autoconfig()
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save'}
c.auto_save.interval = 15000
c.auto_save.session = True
c.backend = 'webengine'
c.content.webgl = True
### Keymaps
c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}

c.completion.cmd_history_max_items = 500
c.completion.height = '50%'
c.completion.quick = True
c.completion.show = 'always'
c.completion.shrink = True
c.completion.scrollbar.padding = 2
c.completion.scrollbar.width = 12
c.completion.timestamp_format = '%Y-%m-%d'

# How many URLs to show in the web history. 0: no history / -1: unlimited
c.completion.web_history_max_items = -1

# Valid values: always,multiple-tabs,downloads,never
c.confirm_quit = ['downloads']

c.content.cache.appcache = True

# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain.
#   - never: Don't accept cookies at all.
c.content.cookies.accept = 'no-3rdparty'

c.content.default_encoding = 'utf-8'

# Enable extra tools for Web developers. This needs to be enabled for
#`:inspector` to work and also adds an _Inspect_ entry to the context menu.
#For QtWebEngine, see `--enable-webengine-inspector` in `qutebrowser --help`.
# c.content.developer_extras = True

c.content.dns_prefetch = True
c.content.geolocation = 'ask'
# Valid values: always,never,same-domain
c.content.headers.referer = 'same-domain'
# c.content.headers.user_agent = None
c.content.host_blocking.enabled = True
c.content.host_blocking.lists = ['https://www.malwaredomainlist.com/hostslist/hosts.txt', 'http://someonewhocares.org/hosts/hosts', 'http://winhelp2002.mvps.org/hosts.zip', 'http://malwaredomains.lehigh.edu/files/justdomains.zip', 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext']

c.content.host_blocking.whitelist = ['*.xda-developers.com','f-droid.org']
c.content.hyperlink_auditing = True
c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = True
c.content.local_storage = True
c.content.media_capture = 'ask'
c.content.notifications = 'ask'
c.content.pdfjs = True
c.content.plugins = True

# c.content.netrc_file = None
# c.content.private_browsing = False
#c.content.user_stylesheets = ['~/.img/ffox/solarized-everything-css/css/solarized-all-sites-light.css']
# c.downloads.location.directory = None
# c.downloads.location.prompt = True
# c.downloads.location.remember = True
c.downloads.open_dispatcher = "xdg-open"
# c.downloads.position = 'top'
# c.downloads.remove_finished = -1 # seconds before downloads are removed from list
# c.editor.command = ['gvim', '-f', '{}']
# c.editor.encoding = 'utf-8'
# c.fonts.completion.category = 'bold 8pt monospace'
# c.fonts.completion.entry = '8pt monospace'
# c.fonts.debug_console = '8pt monospace'
# c.fonts.downloads = '8pt monospace'
# c.fonts.hints = 'bold 10pt monospace'
# c.fonts.keyhint = '8pt monospace'
# c.fonts.messages.error = '8pt monospace'
# c.fonts.messages.info = '8pt monospace'
# c.fonts.messages.warning = '8pt monospace'
c.fonts.monospace = '"Ubuntu Mono", "xos4 Terminus", Terminus, Monospace, "DejaVu Sans Mono", Monaco, "Bitstream Vera Sans Mono", "Andale Mono", "Courier New", Courier, "Liberation Mono", monospace, Fixed, Consolas, Terminal'
# c.fonts.prompts = '8pt sans-serif'
# c.fonts.statusbar = '8pt monospace'
# c.fonts.tabs = '8pt monospace'
# c.fonts.web.family.cursive = ''
# c.fonts.web.family.fantasy = ''
# c.fonts.web.family.fixed = ''
# c.fonts.web.family.sans_serif = ''
# c.fonts.web.family.serif = ''
# c.fonts.web.family.standard = ''
# c.fonts.web.size.default = 16
# c.fonts.web.size.default_fixed = 13
c.fonts.web.size.minimum = 8
# c.fonts.web.size.minimum_logical = 6
# Controls when a hint can be automatically followed without pressing Enter.
## Valid values:
##   - always: Auto-follow whenever there is only a single hint on a page.
##   - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
##   - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
##   - never: The user will always need to press Enter to follow a hint.
# c.hints.auto_follow = 'unique-match'

# c.hints.auto_follow_timeout = 0
# c.hints.border = '1px solid #E3BE23'
# c.hints.chars = 'asdfghjkl'
# c.hints.dictionary = '/usr/share/dict/words'
c.hints.find_implementation = 'javascript'
# c.hints.hide_unmatched_rapid_hints = True
# c.hints.min_chars = 1

## Mode to use for hints.
## Type: String
## Valid values:
##   - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
##   - letter: Use the chars in the `hints.chars` setting.
##   - word: Use hints words based on the html elements and the extra words.
c.hints.mode = 'word'

## A comma-separated list of regexes to use for 'next' links.
# c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>→≫]\\b', '\\b(>>|»)\\b', '\\bcontinue\\b']

## A comma-separated list of regexes to use for 'prev' links.
# c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<←≪]\\b', '\\b(<<|«)\\b']

## Scatter hint key chains (Vimium) or not (dwb). Ignored for number hints.
# c.hints.scatter = True

## Make chars in hint strings uppercase.
# c.hints.uppercase = False

## The maximum time in minutes between two history items for them to be
## considered being from the same browsing session. Items with less time
## between them are grouped when being displayed in `:history`. Use -1 to
## disable separation.
# c.history_gap_interval = 30

# c.ignore_case = 'smart'

## Forward unbound keys to the webview in normal mode.
## Type: String
## Valid values:
##   - all: Forward all unbound keys.
##   - auto: Forward unbound non-alphanumeric keys.
##   - none: Don't forward any keys.
# c.input.forward_unbound_keys = 'none'

## Leave insert mode if a non-editable element is clicked.
# c.input.insert_mode.auto_leave = True

# Automatically enter insert mode if an editable element is focused after loading.
# c.input.insert_mode.auto_load = False

## Switch to insert mode when clicking plugins.
# c.input.insert_mode.plugins = False

## Include hyperlinks in the keyboard focus chain when tabbing.
# c.input.links_included_in_focus_chain = True

## Timeout (in milliseconds) for partially typed key bindings. If the
## current input forms only partial matches, the keystring will be
## cleared after this time.
c.input.partial_timeout = 500

## Enable Spatial Navigation. Spatial navigation consists in the ability
## to navigate between focusable elements in a Web page, such as
## hyperlinks and form controls, by using Left, Right, Up and Down arrow
## keys. For example, if a user presses the Right key, heuristics
## determine whether there is an element he might be trying to reach
## towards the right and which element he probably wants.
c.input.spatial_navigation = True

## Time from pressing a key to seeing the keyhint dialog (ms).
# c.keyhint.delay = 500

## Time (in ms) to show messages in the statusbar for. Set to 0 to never
## clear messages.
# c.messages.timeout = 2000

## Show messages in unfocused windows.
# c.messages.unfocused = False

## How to open links in an existing instance if a new one is launched.
## This happens when e.g. opening a link from a terminal. See
## `new_instance_open_target_window` to customize in which window the
## link is opened in.
## Valid values:
##   - tab: Open a new tab in the existing window and activate the window.
##   - tab-bg: Open a new background tab in the existing window and activate the window.
##   - tab-silent: Open a new tab in the existing window without activating the window.
##   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
##   - window: Open in a new window.
# c.new_instance_open_target = 'tab'

## Which window to choose when opening links as new tabs. When
## `new_instance_open_target` is not set to `window`, this is ignored.
## Type: String
## Valid values:
##   - first-opened: Open new tabs in the first (oldest) opened window.
##   - last-opened: Open new tabs in the last (newest) opened window.
##   - last-focused: Open new tabs in the most recently focused window.
##   - last-visible: Open new tabs in the most recently visible window.
# c.new_instance_open_target_window = 'last-focused'

## Show a filebrowser in upload/download prompts.
# c.prompt.filebrowser = True

## The rounding radius for the edges of prompts.
# c.prompt.radius = 8

## Force a Qt platform to use. This sets the `QT_QPA_PLATFORM`
## environment variable and is useful to force using the XCB plugin when
## running QtWebEngine on Wayland.
# c.qt.force_platform = None

c.scrolling.bar = False
c.scrolling.smooth = True

## The name of the session to save by default. If this is set to null,
## the session which was last loaded is saved.
# c.session_default_name = None

## Spell checking languages. You can check for available languages and
## install dictionaries using scripts/install_dict.py. Run the script
## with -h/--help for instructions.
c.spellcheck.languages = ['en-US','en-GB','sq']

# c.statusbar.hide = False
# c.statusbar.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 0}
# c.statusbar.position = 'bottom'
c.tabs.background = True
c.tabs.close_mouse_button = 'right'
# c.tabs.favicons.scale = 1.0
# c.tabs.favicons.show = True
# c.tabs.indicator_padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 4}
c.tabs.last_close = 'close'
# c.tabs.mousewheel_switching = True
# c.tabs.new_position.related = 'next'
# c.tabs.new_position.unrelated = 'last'
# c.tabs.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}
c.tabs.position = 'bottom'
c.tabs.select_on_remove = 'last-used'
c.tabs.show = 'multiple'
# c.tabs.show_switching_delay = 800
# c.tabs.tabs_are_windows = False
# c.tabs.title.alignment = 'left'

## The format to use for the tab title. The following placeholders are
## defined:  * `{perc}`: The percentage as a string like `[10%]`. *
## `{perc_raw}`: The raw percentage, e.g. `10` * `{title}`: The title of
## the current web page * `{title_sep}`: The string ` - ` if a title is
## set, empty otherwise. * `{index}`: The index of this tab. * `{id}`:
## The internal tab ID of this tab. * `{scroll_pos}`: The page scroll
## position. * `{host}`: The host of the current web page. * `{backend}`:
## Either ''webkit'' or ''webengine'' * `{private}` : Indicates when
## private mode is enabled.
# c.tabs.title.format = '{index}: {title}'

## The format to use for the tab title for pinned tabs. The same
## placeholders like for `tabs.title.format` are defined.
## Type: FormatString
# c.tabs.title.format_pinned = '{index}'

## The width of the tab bar if it's vertical, in px or as percentage of
## the window.
## Type: PercOrInt
# c.tabs.width.bar = '20%'

## Width of the progress indicator (0 to disable).
## Type: Int
# c.tabs.width.indicator = 3

## Whether to wrap when changing tabs.
## Type: Bool
# c.tabs.wrap = True

## Whether to start a search when something else than a URL is entered.
## Type: String
## Valid values:
##   - naive: Use simple/naive check.
##   - dns: Use DNS requests (might be slow!).
##   - never: Never search automatically.
# c.url.auto_search = 'naive'

## The page to open if :open -t/-b/-w is used without URL. Use
## `about:blank` for a blank page.
## Type: FuzzyUrl
# c.url.default_page = 'https://start.duckduckgo.com/'

## The URL segments where `:navigate increment/decrement` will search for
## a number.
## Type: FlagList
## Valid values:
##   - host
##   - path
##   - query
##   - anchor
# c.url.incdec_segments = ['path', 'query']

## Definitions of search engines which can be used via the address bar.
## Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
## `{}` placeholder. The placeholder will be replaced by the search term,
## use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
## `DEFAULT` is used when `url.auto_search` is turned on and something
## else than a URL was entered to be opened. Other search engines can be
## used by prepending the search engine name to the search term, e.g.
## `:open google qutebrowser`.
## Type: Dict
# c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}

## The page(s) to open at the start.
## Type: List of FuzzyUrl, or FuzzyUrl
# c.url.start_pages = ['https://start.duckduckgo.com']

## The URL parameters to strip with `:yank url`.
## Type: List of String
# c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']

## Hide the window decoration when using wayland (requires restart)
## Type: Bool
# c.window.hide_wayland_decoration = False

## The format to use for the window title. The following placeholders are
## defined:  * `{perc}`: The percentage as a string like `[10%]`. *
## `{perc_raw}`: The raw percentage, e.g. `10` * `{title}`: The title of
## the current web page * `{title_sep}`: The string ` - ` if a title is
## set, empty otherwise. * `{id}`: The internal window ID of this window.
## * `{scroll_pos}`: The page scroll position. * `{host}`: The host of
## the current web page. * `{backend}`: Either ''webkit'' or
## ''webengine'' * `{private}` : Indicates when private mode is enabled.
## Type: FormatString
# c.window.title_format = '{perc}{title}{title_sep}qutebrowser'

## The default zoom level.
## Type: Perc
# c.zoom.default = '100%'

## The available zoom levels.
## Type: List of Perc
# c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%', '175%', '200%', '250%', '300%', '400%', '500%']

## How much to divide the mouse wheel movements to translate them into
## zoom increments.
## Type: Int
# c.zoom.mouse_divider = 512

## Whether the zoom factor on a frame applies only to the text or to all
## content.
## Type: Bool
# c.zoom.text_only = False

###### KEYBINDS ######

## Bindings for normal mode
# config.bind("'", 'enter-mode jump_mark')
# config.bind('+', 'zoom-in')
# config.bind('-', 'zoom-out')
# config.bind('.', 'repeat-command')
# config.bind('/', 'set-cmd-text /')
# config.bind(':', 'set-cmd-text :')
# config.bind(';I', 'hint images tab')
# config.bind(';O', 'hint links fill :open -t -r {hint-url}')
# config.bind(';R', 'hint --rapid links window')
# config.bind(';Y', 'hint links yank-primary')
# config.bind(';b', 'hint all tab-bg')
# config.bind(';d', 'hint links download')
# config.bind(';f', 'hint all tab-fg')
# config.bind(';h', 'hint all hover')
# config.bind(';i', 'hint images')
# config.bind(';o', 'hint links fill :open {hint-url}')
# config.bind(';r', 'hint --rapid links tab-bg')
# config.bind(';t', 'hint inputs')
# config.bind(';y', 'hint links yank')
# config.bind('<Alt-1>', 'tab-focus 1')
# config.bind('<Alt-2>', 'tab-focus 2')
# config.bind('<Alt-3>', 'tab-focus 3')
# config.bind('<Alt-4>', 'tab-focus 4')
# config.bind('<Alt-5>', 'tab-focus 5')
# config.bind('<Alt-6>', 'tab-focus 6')
# config.bind('<Alt-7>', 'tab-focus 7')
# config.bind('<Alt-8>', 'tab-focus 8')
# config.bind('<Alt-9>', 'tab-focus -1')
# config.bind('<Ctrl-A>', 'navigate increment')
# config.bind('<Ctrl-Alt-p>', 'print')
# config.bind('<Ctrl-B>', 'scroll-page 0 -1')
# config.bind('<Ctrl-D>', 'scroll-page 0 0.5')
# config.bind('<Ctrl-F5>', 'reload -f')
# config.bind('<Ctrl-F>', 'scroll-page 0 1')
# config.bind('<Ctrl-N>', 'open -w')
# config.bind('<Ctrl-PgDown>', 'tab-next')
# config.bind('<Ctrl-PgUp>', 'tab-prev')
# config.bind('<Ctrl-Q>', 'quit')
# config.bind('<Ctrl-Return>', 'follow-selected -t')
# config.bind('<Ctrl-Shift-N>', 'open -p')
# config.bind('<Ctrl-Shift-T>', 'undo')
# config.bind('<Ctrl-Shift-W>', 'close')
# config.bind('<Ctrl-T>', 'open -t')
# config.bind('<Ctrl-Tab>', 'tab-focus last')
# config.bind('<Ctrl-U>', 'scroll-page 0 -0.5')
# config.bind('<Ctrl-V>', 'enter-mode passthrough')
# config.bind('<Ctrl-W>', 'tab-close')
# config.bind('<Ctrl-X>', 'navigate decrement')
# config.bind('<Ctrl-^>', 'tab-focus last')
# config.bind('<Ctrl-h>', 'home')
# config.bind('<Ctrl-p>', 'tab-pin')
# config.bind('<Ctrl-s>', 'stop')
# config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
# config.bind('<F11>', 'fullscreen')
# config.bind('<F5>', 'reload')
# config.bind('<Return>', 'follow-selected')
# config.bind('<back>', 'back')
# config.bind('<forward>', 'forward')
# config.bind('=', 'zoom')
# config.bind('?', 'set-cmd-text ?')
# config.bind('@', 'run-macro')
# config.bind('B', 'set-cmd-text -s :quickmark-load -t')
# config.bind('D', 'tab-close -o')
# config.bind('F', 'hint all tab')
# config.bind('G', 'scroll-to-perc')
# config.bind('H', 'back')
# config.bind('J', 'tab-next')
# config.bind('K', 'tab-prev')
# config.bind('L', 'forward')
# config.bind('M', 'bookmark-add')
# config.bind('N', 'search-prev')
# config.bind('O', 'set-cmd-text -s :open -t')
# config.bind('PP', 'open -t -- {primary}')
# config.bind('Pp', 'open -t -- {clipboard}')
# config.bind('R', 'reload -f')
# config.bind('Sb', 'open qute://bookmarks#bookmarks')
# config.bind('Sh', 'open qute://history')
# config.bind('Sq', 'open qute://bookmarks')
# config.bind('Ss', 'open qute://settings')
# config.bind('T', 'tab-focus')
# config.bind('ZQ', 'quit')
# config.bind('ZZ', 'quit --save')
# config.bind('[[', 'navigate prev')
# config.bind(']]', 'navigate next')
# config.bind('`', 'enter-mode set_mark')
# config.bind('ad', 'download-cancel')
# config.bind('b', 'set-cmd-text -s :quickmark-load')
# config.bind('cd', 'download-clear')
# config.bind('co', 'tab-only')
# config.bind('d', 'tab-close')
# config.bind('f', 'hint')
# config.bind('g$', 'tab-focus -1')
# config.bind('g0', 'tab-focus 1')
# config.bind('gB', 'set-cmd-text -s :bookmark-load -t')
# config.bind('gC', 'tab-clone')
# config.bind('gO', 'set-cmd-text :open -t -r {url:pretty}')
# config.bind('gU', 'navigate up -t')
# config.bind('g^', 'tab-focus 1')
# config.bind('ga', 'open -t')
# config.bind('gb', 'set-cmd-text -s :bookmark-load')
# config.bind('gd', 'download')
# config.bind('gf', 'view-source')
# config.bind('gg', 'scroll-to-perc 0')
# config.bind('gl', 'tab-move -')
# config.bind('gm', 'tab-move')
# config.bind('go', 'set-cmd-text :open {url:pretty}')
# config.bind('gr', 'tab-move +')
# config.bind('gt', 'set-cmd-text -s :buffer')
# config.bind('gu', 'navigate up')
# config.bind('h', 'scroll left')
# config.bind('i', 'enter-mode insert')
# config.bind('j', 'scroll down')
# config.bind('k', 'scroll up')
# config.bind('l', 'scroll right')
# config.bind('m', 'quickmark-save')
# config.bind('n', 'search-next')
# config.bind('o', 'set-cmd-text -s :open')
# config.bind('pP', 'open -- {primary}')
# config.bind('pp', 'open -- {clipboard}')
# config.bind('q', 'record-macro')
# config.bind('r', 'reload')
# config.bind('sf', 'save')
# config.bind('sk', 'set-cmd-text -s :bind')
# config.bind('sl', 'set-cmd-text -s :set -t')
# config.bind('ss', 'set-cmd-text -s :set')
# config.bind('th', 'back -t')
# config.bind('tl', 'forward -t')
# config.bind('u', 'undo')
# config.bind('v', 'enter-mode caret')
# config.bind('wB', 'set-cmd-text -s :bookmark-load -w')
# config.bind('wO', 'set-cmd-text :open -w {url:pretty}')
# config.bind('wP', 'open -w -- {primary}')
# config.bind('wb', 'set-cmd-text -s :quickmark-load -w')
# config.bind('wf', 'hint all window')
# config.bind('wh', 'back -w')
# config.bind('wi', 'inspector')
# config.bind('wl', 'forward -w')
# config.bind('wo', 'set-cmd-text -s :open -w')
# config.bind('wp', 'open -w -- {clipboard}')
# config.bind('xO', 'set-cmd-text :open -b -r {url:pretty}')
# config.bind('xb', 'config-cycle statusbar.hide')
# config.bind('xo', 'set-cmd-text -s :open -b')
# config.bind('xt', 'config-cycle tabs.show always switching')
# config.bind('xx', 'config-cycle statusbar.hide ;; config-cycle tabs.show always switching')
# config.bind('yD', 'yank domain -s')
# config.bind('yP', 'yank pretty-url -s')
# config.bind('yT', 'yank title -s')
# config.bind('yY', 'yank -s')
# config.bind('yd', 'yank domain')
# config.bind('yp', 'yank pretty-url')
# config.bind('yt', 'yank title')
# config.bind('yy', 'yank')
# config.bind('{{', 'navigate prev -t')
# config.bind('}}', 'navigate next -t')

## Bindings for caret mode
# config.bind('$', 'move-to-end-of-line', mode='caret')
# config.bind('0', 'move-to-start-of-line', mode='caret')
# config.bind('<Ctrl-Space>', 'drop-selection', mode='caret')
# config.bind('<Escape>', 'leave-mode', mode='caret')
# config.bind('<Return>', 'yank selection', mode='caret')
# config.bind('<Space>', 'toggle-selection', mode='caret')
# config.bind('G', 'move-to-end-of-document', mode='caret')
# config.bind('H', 'scroll left', mode='caret')
# config.bind('J', 'scroll down', mode='caret')
# config.bind('K', 'scroll up', mode='caret')
# config.bind('L', 'scroll right', mode='caret')
# config.bind('Y', 'yank selection -s', mode='caret')
# config.bind('[', 'move-to-start-of-prev-block', mode='caret')
# config.bind(']', 'move-to-start-of-next-block', mode='caret')
# config.bind('b', 'move-to-prev-word', mode='caret')
# config.bind('c', 'enter-mode normal', mode='caret')
# config.bind('e', 'move-to-end-of-word', mode='caret')
# config.bind('gg', 'move-to-start-of-document', mode='caret')
# config.bind('h', 'move-to-prev-char', mode='caret')
# config.bind('j', 'move-to-next-line', mode='caret')
# config.bind('k', 'move-to-prev-line', mode='caret')
# config.bind('l', 'move-to-next-char', mode='caret')
# config.bind('v', 'toggle-selection', mode='caret')
# config.bind('w', 'move-to-next-word', mode='caret')
# config.bind('y', 'yank selection', mode='caret')
# config.bind('{', 'move-to-end-of-prev-block', mode='caret')
# config.bind('}', 'move-to-end-of-next-block', mode='caret')

## Bindings for command mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='command')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
# config.bind('<Alt-D>', 'rl-kill-word', mode='command')
# config.bind('<Alt-F>', 'rl-forward-word', mode='command')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='command')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='command')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='command')
# config.bind('<Ctrl-D>', 'completion-item-del', mode='command')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='command')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='command')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='command')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='command')
# config.bind('<Ctrl-N>', 'command-history-next', mode='command')
# config.bind('<Ctrl-P>', 'command-history-prev', mode='command')
# config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
# config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='command')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='command')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='command')
# config.bind('<Down>', 'command-history-next', mode='command')
# config.bind('<Escape>', 'leave-mode', mode='command')
# config.bind('<Return>', 'command-accept', mode='command')
# config.bind('<Shift-Delete>', 'completion-item-del', mode='command')
# config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
# config.bind('<Tab>', 'completion-item-focus next', mode='command')
# config.bind('<Up>', 'command-history-prev', mode='command')

## Bindings for hint mode
# config.bind('<Ctrl-B>', 'hint all tab-bg', mode='hint')
# config.bind('<Ctrl-F>', 'hint links', mode='hint')
# config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
# config.bind('<Escape>', 'leave-mode', mode='hint')
# config.bind('<Return>', 'follow-hint', mode='hint')

## Bindings for insert mode
# config.bind('<Ctrl-E>', 'open-editor', mode='insert')
# config.bind('<Escape>', 'leave-mode', mode='insert')
# config.bind('<Shift-Ins>', 'insert-text {primary}', mode='insert')

## Bindings for passthrough mode
# config.bind('<Ctrl-V>', 'leave-mode', mode='passthrough')

## Bindings for prompt mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
# config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
# config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='prompt')
# config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
# config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Escape>', 'leave-mode', mode='prompt')
# config.bind('<Return>', 'prompt-accept', mode='prompt')
# config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
# config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')
# config.bind('n', 'prompt-accept no', mode='prompt')
# config.bind('y', 'prompt-accept yes', mode='prompt')

## Bindings for register mode
# config.bind('<Escape>', 'leave-mode', mode='register')
