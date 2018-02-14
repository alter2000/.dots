# Hello there

<sup>General Kenobi</sup>

Here's my dotfiles. If you want anything specific, just copy ahead. I use [dotbot](https://github.com/anishathalye/dotbot), so if you want to use it as-is, typey type this:

```shell
git clone https://github.com/alter2000/.dots.git
cd .dots/
./install
```

Note that this will also install everything I usually need if you're on Arch (thanks to [dotbot-pacaur])). No pictures or keybinding tables here since it's evolving until I settle in my own hardware and workflow (there's definitely Vi navigation and probably a custom keymap somewhere in here).

**Edit:** it seems I've settled on a specific design, so I should maybe describe after a while. My commit messages will only be "backup" from now on (as if they were more descriptive before).

## Themery

* Numix for GUI applications run as root
* Arc-darker for most GTK apps
* Configure Qt apps to use GTK theme via `qt5ct`
* Colorschemes via pywal, otherwise Nord for Atom, modified Gruvbox for terminal and Pyte for Gvim during the day (Gruvbox otherwise)
	* Solarized for Wikipedia (user CSS + Wikipedia Paper)
	* Reddit-No-Frills

**TODO**  
Set up some decent templating engine like [gorice]; wal or wpgtk doesn't cut it, but I think [this wallpaper] is pretty nice, so I probably won't move as much from now on.

## Apps

* Shell: Zsh + Powerlevel9k
* Editor: Vim
* Main plugins:
	* Calendar
	* [Vmail] (separate gem based on Vim)
	* [Airline]
	* [Gundo]
	* [Tabular]
	* [Pandoc] + [Goyo]
	* [Vimtex]
	* [vim-minimap]
* Terminal: Termite + Tmux
* PDF viewer: Zathura
* Email: vmail; settling into mutt + offlineimap seems too much of a hassle (offlineimap is a great tool nonetheless)
* Notes: ~/todo.txt + Vim for everything
* Password manager: pass (+git +rofi)

[gorice](https://gitlab.com/sj1k/gorice/)
[this wallpaper](https://github.com/alter2000/.dots/tree/master/img/deltawing_ships.png)
[dotbot-pacaur](https://github.com/ajlende/dotbot-pacaur)

[Vmail](https://github.com/danchoi/vmail)
[Airline](https://github.com/vim-airline/vim-airline)
[Gundo](https://github.com/sjl/gundo.vim)
[Tabular](https://github.com/godlygeek/tabular)
[Pandoc](https://github.com/vim-pandoc-vim-pandoc)
[Goyo](https://github.com/junegunn/goyo.vim)
[Vimtex](https://github.com/lervag/vimtex)
[vim-minimap](https://github.com/severin-lemaignan/vim-minimap')
