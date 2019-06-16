{ config, pkgs, ... }:

let
  lcfg = (if builtins.pathExists ./local.nix then ./local.nix else {});
in
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {

    extraOutputsToInstall = [ "doc" "devdoc" ];
    variables = {
      PAGER = "less --ignore-case --status-column --raw-control-chars --quiet --window=-3";
      EDITOR = "vim";
      GIO_EXTRA_MODULES = [ "${pkgs.gvfs}/lib/gio/modules" ];
    };

    systemPackages = with pkgs; [
      acpi
      curl
      elinks exfat
      file
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

      aspell aspellDicts.en aspellDicts.fr aspellDicts.de
      gucharmap gvfs
      mpv
      ncdu
      pavucontrol
      tig
      unzip
    ]
    ++ (if config.services.xserver.enable then [
      chromium
      firefox
      torbrowser
      xarchiver xorg.xev xdotool xclip xsel
      xfce.thunar-bare
    ] else [])
    ++ (lcfg.extraPackages or []);
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
