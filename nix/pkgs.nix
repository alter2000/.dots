{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {

    variables = {
      PAGER = "less --ignore-case --status-column --raw-control-chars --quiet --window=-3";
      EDITOR = "vim";
      GIO_EXTRA_MODULES = [ "${pkgs.gvfs}/lib/gio/modules" ];
    };

    systemPackages = with pkgs; [
      alsaUtils ansible
      calcurse chromium clang ctags curl
      dia dunst
      elinks exfat
      firefox feh
      git
      gnupg
      gparted
      htop
      icdiff imagemagick imv iproute
      keynav
      libnotify
      mosh msmtp
      networkmanager neomutt ntfs3g
      offlineimap
      pamixer pandoc parallel pass
      ranger ripgrep rsync ruby
      slurm stdman
      tlp tmux tree
      urlview usbutils
      virtmanager virt-viewer
      (vimHugeX.override { python = python3; })
      ansible-lint vim-vint shfmt mypy
      w3m wget wirelesstools
      xarchiver xorg.xev xdotool xclip xsel

      (python37.withPackages(pks: with pks; [
        ipython
        python
        pip
        conda
        virtualenv

        yapf
        neovim
        # terminal_velocity
        ]))

      alacritty
      aspell aspellDicts.en aspellDicts.fr aspellDicts.de
      beets
      gucharmap gvfs
      maim moon-buggy mpc_cli mpd mpv
      neofetch newsboat ncdu ncmpcpp
      pavucontrol pipes pulsemixer pywal
      redshift rofi
      slop sxhkd
      teeworlds termite tig toilet transmission-gtk torbrowser
      unzip
      vagrant
      youtube-dl
      zathura
      (polybar.override {
        githubSupport = true;
        i3Support = true;
        # i3GapsSupport = true;
        nlSupport = true;
        mpdSupport = true;
        pulseSupport = true;
        })
      ];
    };

  nixpkgs = {
    config = {
      allowUnfree = true;
      firefox = {
      };
    };
    # overlays = {
    # };
  };
}
