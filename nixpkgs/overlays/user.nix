# kanged from https://gist.github.com/LnL7/570349866bb69467d0caf5cb175faa74
self: super:

{
  userPackages = super.userPackages or {} // {
    xmonad-with-packages = self.xmonad-with-packages;
    nodejs-11_x = self.nodejs-11_x;
    # busybox = self.busybox;

    alsaUtils = self.alsaUtils;
    gparted = self.gparted;
    # skype = self.skype;

    calcurse = self.calcurse;
    gnupg = self.gnupg;
    jrnl = self.jrnl;
    keynav = self.keynav;
    taskell = self.taskell;
    zip = self.zip;
    sxhkd = self.sxhkd;

    xbanish = self.xbanish;
    xorg.xinit = self.xorg.xinit;
    xorg.xkbcomp = self.xorg.xkbcomp;

    feedreader = self.feedreader;
    fractal = self.fractal;
    hledger = self.hledger;
    hledger-web = self.hledger-web;
    signal-desktop = self.signal-desktop;

    imagemagick = self.imagemagick;
    imv = self.imv;
    feh = self.feh;
    autorandr = self.autorandr;
    libnotify = self.libnotify;
    msmtp = self.msmtp;
    neomutt = self.neomutt;
    offlineimap = self.offlineimap;
    pamixer = self.pamixer;
    pass = self.pass;
    passff-host = self.passff-host;
    pass-git-helper = self.gitAndTools.pass-git-helper;
    slurm = self.slurm;
    urlscan = self.urlscan;
    zathura = self.zathura;
    vimHugeX = self.vimHugeX;
    cryptsetup = self.cryptsetup;

    maim = self.maim;
    neofetch = self.neofetch;
    newsboat = self.newsboat;
    ncmpcpp = self.ncmpcpp;
    weechat = self.weechat;
    # ultimate plumber
    up = self.up;

    ncdu = self.ncdu;
    pavucontrol = self.pavucontrol;
    pipes = self.pipes;
    pulsemixer = self.pulsemixer;
    pywal = self.pywal;
    mpc_cli = self.mpc_cli;
    mpd = self.mpd;
    mpv = self.mpv;

    teeworlds = self.teeworlds;
    termite = self.termite;
    alacritty = self.alacritty;
    toilet = self.toilet;
    transmission-gtk = self.transmission-gtk;

    lolcat = super.lowPrio self.lolcat;
    beets = self.beets;
    steam = self.steam;
    minecraft = self.minecraft;

    nix-env-rebuild = super.writeScriptBin "nix-env-rebuild" ''
      #!${super.stdenv.shell}
      if ! command -v nix-env &>/dev/null; then
          echo "warning: nix-env was not found in PATH, add nix to userPackages" >&2
          PATH=${self.nix}/bin:$PATH
      fi
      exec nix-env -f '<nixpkgs>' -r -iA \
            userPackages \
            unstablePackages \
            cPkgs \
            pyPkgs \
            rubyPkgs \
            rustPkgs \
            haskellPkgs \
            devPkgs \
            "$@"
    '';

    pandoc = self.pandoc;
    myTexlive = self.texlive.combine {
      inherit (self.texlive) scheme-full noto;
      # pkgFilter = pkg: pkg.tlType == "run" || pkg.tlType == "bin" || pkg.pname == "cm-super";
    };
  };
}
