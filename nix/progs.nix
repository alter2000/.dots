{ config, pkgs, ... }:

{
  programs = {
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    mtr.enable = true;
    adb.enable = true;
    less.enable = true;
    light.enable = true;

    bash.enableCompletion = true;
    fish = {
      enable = true;
      vendor = {
        config.enable = true;
        completions.enable = true;
        functions.enable = true;
      };
    };
    zsh = { enable = true; autosuggestions.enable = true; };

    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
        enableBrowserSocket = true;
      };
      dirmngr.enable = true;
    };

  };

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;
    fonts = with pkgs; [
      fira
      iosevka
      liberation_ttf
      libre-baskerville
      noto-fonts
      overpass
      roboto
      siji
    ];

    fontconfig = {
      enable = true;
      allowBitmaps = false;
      cache32Bit = true;
      hinting.enable = true;
      # subpixel.lcdFilter = ;

      defaultFonts = {
        monospace = [ "League Mono" "Hasklig" "IBM Plex Mono" "Powerline Extra Symbols" ];
        sansSerif = [ "Overpass" "IBM Plex Sans" "Noto Sans" ];
        serif = [ "CMU Serif" "Liberation Serif" "Noto Serif" ];
      };

    };

  };
}
