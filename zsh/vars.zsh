export PATH="$HOME/.local/bin:$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export CLICOLOR=1
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='nano'
export ZDOTDIR="$HOME/.zsh"
export ARCHFLAGS='-arch x86_64'
export GITHUB_USER='alter2000'
export fpath=(/home/alter2000/.zsh/completions/ $fpath)


### POWERLEVEL9K ###
DEFAULT_USER="alter2000"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(background_jobs context dir custom_wifi_signal vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery time)
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=30
POWERLEVEL9K_BATTERY_VERBOSE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_DELIMITER=''
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_STATUS_HIDE_SIGNAME=true
POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="p9k_wifi_signal"

