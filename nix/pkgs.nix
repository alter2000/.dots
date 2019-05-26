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
      acpi alsaUtils ansible
      calcurse chromium clang ctags curl
      # dunst
      elinks exfat
      file firefox feh
      git gnupg gparted
      htop
      icdiff imagemagick imv iproute
      keynav
      libnotify lolcat
      mosh msmtp
      neomutt nixops ntfs3g
      offlineimap
      pamixer pandoc parallel pass
      ranger ripgrep rsync ruby
      slurm stdman
      tlp tmux tree
      urlscan usbutils
      virtmanager vimHugeX
      ansible-lint vim-vint shfmt mypy
      w3m wget wirelesstools
      xarchiver xorg.xev xdotool xclip xsel

      gnumake
      nodejs

      (python37.withPackages(ps: with ps; [
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
      slop sourcetrail sxhkd
      teeworlds termite tig toilet transmission-gtk torbrowser
      unzip
      xfce.thunar-bare
      vagrant
      youtube-dl
      zathura
      polybar
    ];
  };

  nixpkgs = {
    config = {
      packageOverrides = pkgs: rec {
        polybar = pkgs.polybar.override {
          githubSupport = true;
          i3Support = true;
          # i3GapsSupport = true;
          nlSupport = true;
          mpdSupport = true;
          pulseSupport = true;
        };
        vimHugeX = pkgs.vimHugeX.override {
          python = pkgs.python3;
        };
      };
      allowUnfree = true;
      firefox = {
      };
    };
    # overlays = {
    # };
  };
}
