{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ag alsaUtils apulse ansible
    calcurse chromium clang ctags
    dia dunst
    elinks exfat
    firefox feh
    git gnuplot gparted
    handbrake hashcat htop
    icdiff imagemagick imv
    kbfs keybase keynav
    lftp ldm lxc libnotify
    mosh msmtp
    gnome3.nautilus networkmanager neomutt ntfs3g
    offlineimap
    pamixer pandoc parallel pass pinentry_ncurses
    python36Packages.python python36Packages.ipython
    ranger rsync ruby
    slurm stdman
    tlp tmux tree
    urlview usbutils
    virtmanager virt-viewer
    ( vimHugeX.override { python = python3; })
      ansible-lint vim-vint shfmt
    w3m wget
    xarchiver xorg.xev xdotool xclip xsel
    zeal

    (python37.withPackages(pks: with pks; [
      pip
      conda
      virtualenv

      yapf
      neovim
      # terminal_velocity
    ]))

    alacritty arc-theme asciinema
    beets bsdgames bspwm
    compton
    gimp gucharmap gvfs
    handbrake
    inkscape
    libreoffice-fresh
    maim moon-buggy mpc_cli mpd mpv
    neofetch newsboat ncdu ncmpcpp numix-gtk-theme
    papirus-icon-theme pavucontrol pipes pulsemixer pywal
    redshift rofi rtv
    scrot slop sxhkd superTuxKart
    teeworlds termite tig toilet transmission-gtk torbrowser
    unzip
    vagrant
    wikicurses wordgrinder
    youtube-dl
    zathura ];

    nixpkgs.config = {
      allowUnfree = true;
        packageOverrides = pkgs: {
          polybar = pkgs.polybar.override {
            githubSupport = true;
            # i3Support = true;
            i3GapsSupport = true;
            mpdSupport = true;
          };
        };
    };
}
