# kanged from https://gist.github.com/LnL7/570349866bb69467d0caf5cb175faa74
self: super:

{
  userPackages = super.userPackages or {} // {

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
              # rubyPkgs
              rustPkgs
              haskellPkgs
              devPkgs
              mdiPkgs
      )
      exec nix-env -f '<nixpkgs>' -r -iA \
            ''${PENV[@]} \
            "$@"
    '';

    inherit (self)
      # xmonad-with-packages
      nodejs-11_x
      # busybox
      cachix

      alsaUtils
      gparted
      # skype

      gnupg
      jrnl
      keynav
      taskell
      zip
      sxhkd
      firefox
      go-mtpfs

      hledger
      signal-desktop
      torbrowser
      macchanger

      imagemagick
      imv
      feh
      autorandr
      libnotify
      msmtp
      neomutt
      notmuch
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
      xbanish
    ;

    inherit (self)
      steam
      endless-sky
      minecraft
      jdk
    ;

    inherit (self.xorg)
      xinit
      xkbcomp
    ;

    inherit (self.gitAndTools)
      pass-git-helper
    ;

    myTexlive = super.texlive.combine {
      inherit (self.texlive) scheme-full noto;
      # pkgFilter = pkg: pkg.tlType == "run" || pkg.tlType == "bin" || pkg.pname == "cm-super";
    };

    pboy = import (fetchTarball https://github.com/2mol/pboy/tarball/master);
  };

}
