# kanged from https://gist.github.com/LnL7/570349866bb69467d0caf5cb175faa74
self: super:

{
  userPackages = super.userPackages or {} // {
    inherit (self)
      # xmonad-with-packages
      nodejs-11_x
      # busybox

      alsaUtils
      gparted
      # skype

      # calcurse
      gnupg
      jrnl
      keynav
      taskell
      zip
      sxhkd
      qutebrowser

      hledger
      signal-desktop

      imagemagick
      imv
      feh
      autorandr
      libnotify
      msmtp
      neomutt
      offlineimap
      pamixer
      pass
      passff-host
      urlscan
      zathura
      vimHugeX
      cryptsetup
      pandoc

      maim
      neofetch
      newsboat
      ncmpcpp
      weechat
      up  # ultimate plumber

      ncdu
      pavucontrol
      pipes
      pulsemixer
      pywal
      mpc_cli
      mpd
      mpv

      teeworlds
      termite
      alacritty
      toilet
      transmission-gtk

      lolcat
      beets
      steam
      minecraft
      jdk

      xbanish
    ;

    inherit (self.xorg)
      xinit
      xkbcomp
    ;

    inherit (self.gitAndTools)
      pass-git-helper
    ;

    nix-env-rebuild = super.writeScriptBin "nix-env-rebuild" ''
      #!${super.stdenv.shell}
      if ! command -v nix-env &>/dev/null; then
          echo "warning: nix-env was not found in PATH, add nix to userPackages" >&2
          PATH=${self.nix}/bin:$PATH
      fi
      PENV=(
              userPackages
              unstablePackages
              # cPkgs
              pyPkgs
              rubyPkgs
              rustPkgs
              haskellPkgs
              devPkgs
      )
      exec nix-env -f '<nixpkgs>' -r -iA \
            ''${PENV[@]}
            "$@"
    '';

    myTexlive = super.texlive.combine {
      inherit (self.texlive) scheme-full noto;
      # pkgFilter = pkg: pkg.tlType == "run" || pkg.tlType == "bin" || pkg.pname == "cm-super";
    };
  };
}
