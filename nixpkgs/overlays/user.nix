# kanged from https://gist.github.com/LnL7/570349866bb69467d0caf5cb175faa74
self: super:

{
  userPackages = super.userPackages or {} // {

    fatcat = import ../pkgs/fatcat.nix { pkgs = self.pkgs; };

    alsaUtils = self.alsaUtils;
    gparted = self.gparted;
    skype = self.skype;
    patchelf = self.patchelf;

    calcurse = self.calcurse;
    gnupg = self.gnupg;
    jrnl = self.jrnl;
    keynav = self.keynav;
    taskell = self.taskell;
    xbanish = self.xbanish;
    xorg.xinit = self.xorg.xinit;

    feedreader = self.feedreader;
    fractal = self.fractal;

    imagemagick = self.imagemagick;
    imv = self.imv;
    feh = self.feh;
    libnotify = self.libnotify;
    msmtp = self.msmtp;
    neomutt = self.neomutt;
    offlineimap = self.offlineimap;
    pamixer = self.pamixer;
    pass = self.pass;
    slurm = self.slurm;
    urlscan = self.urlscan;
    zathura = self.zathura;

    vimHugeX = self.vimHugeX;
      ansible-lint = self.ansible-lint;
      vim-vint = self.vim-vint;
      shfmt = self.shfmt;
      mypy = self.mypy;
      htmlTidy = self.htmlTidy;

    maim = self.maim;
    neofetch = self.neofetch;
    newsboat = self.newsboat;
    ncmpcpp = self.ncmpcpp;
    weechat = self.weechat;

    ncdu = self.ncdu;
    pavucontrol = self.pavucontrol;
    pipes = self.pipes;
    pulsemixer = self.pulsemixer;
    pywal = self.pywal;
    mpc_cli = self.mpc_cli;
    mpd = self.mpd;
    mpv = self.mpv;

    sxhkd = self.sxhkd;
    teeworlds = self.teeworlds;
    termite = self.termite;
    alacritty = self.alacritty;
    tig = self.tig;
    toilet = self.toilet;
    transmission-gtk = self.transmission-gtk;

    lolcat = self.lolcat;
    platformio = self.platformio;
    steam = self.steam;
    beets = self.beets;

    nix-env-rebuild = super.writeScriptBin "nix-env-rebuild" ''
      #!${super.stdenv.shell}
      if ! command -v nix-env &>/dev/null; then
          echo "warning: nix-env was not found in PATH, add nix to userPackages" >&2
          PATH=${self.nix}/bin:$PATH
      fi
      exec nix-env -f '<nixpkgs>' -r -iA \
            userPackages \
            unstablePackages \
            pyPkgs \
            epiPkgs \
            "$@"
    '';

    pandoc = self.pandoc;
    myTexlive = self.texlive.combine {
      inherit (self.texlive) scheme-full noto;
      pkgFilter = pkg: pkg.tlType == "run" || pkg.tlType == "bin" || pkg.pname == "cm-super";
    };
  };
}
