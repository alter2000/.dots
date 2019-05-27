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
      acpi
      chromium curl
      elinks exfat
      file firefox
      git
      htop
      iproute
      manpages mosh
      ntfs3g
      parallel
      ranger ripgrep rsync ruby
      stdmanpages
      tmux tree
      w3m wget wirelesstools
      xarchiver xorg.xev xdotool xclip xsel

      aspell aspellDicts.en aspellDicts.fr aspellDicts.de
      gucharmap gvfs
      mpv
      ncdu
      pavucontrol
      tig torbrowser
      unzip
      xfce.thunar-bare
    ];
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      firefox = { enableAdobeFlash = true; };
    };
    overlays = [
      (self: super: {
        polybar = super.polybar.override {
          githubSupport = true;
          i3Support = true;
          # i3GapsSupport = true;
          nlSupport = true;
          mpdSupport = true;
          pulseSupport = true;
      };})
    ];
  };
}
