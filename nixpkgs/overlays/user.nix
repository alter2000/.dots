# kanged from https://gist.github.com/LnL7/570349866bb69467d0caf5cb175faa74
self: super:

{
  userPackages = super.userPackages or {} // {

    fatcat = (import ../pkgs/fatcat.nix);

    alsaUtils = self.alsaUtils;
    gparted = self.gparted;
    skype = self.skype;

    calcurse = self.calcurse;
    gnupg = self.gnupg;
    jrnl = self.jrnl;
    keynav = self.keynav;
    taskell = self.taskell;
    xbanish = self.xbanish;
    xorg.xinit = self.xorg.xinit;

    feedreader = self.feedreader;
    fractal = self.fractal;

    texlive.combined.scheme-full = self.texlive.combined.scheme-full;
    imagemagick = self.imagemagick;
    imv = self.imv;
    feh = self.feh;
    libnotify = self.libnotify;
    msmtp = self.msmtp;
    neomutt = self.neomutt;
    offlineimap = self.offlineimap;
    pamixer = self.pamixer;
    pandoc = self.pandoc;
    pass = self.pass;
    slurm = self.slurm;
    urlscan = self.urlscan;
    zathura = self.zathura;

    vimHugeX = self.vimHugeX;
      ansible-lint = self.ansible-lint;
      vim-vint = self.vim-vint;
      shfmt = self.shfmt;
      mypy = self.mypy;

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

    python37Packages = self.python37.withPackages(ps: with ps; [
        ipython
        python
        pip
        virtualenv

        yapf
        # neovim

        mps-youtube
        # terminal_velocity
      ]);

    nix-env-rebuild = super.writeScriptBin "nix-env-rebuild" ''
      #!${super.stdenv.shell}
      if ! command -v nix-env &>/dev/null; then
          echo "warning: nix-env was not found in PATH, add nix to userPackages" >&2
          PATH=${self.nix}/bin:$PATH
      fi
      exec nix-env -f '<nixpkgs>' -r -iA epiPackages userPackages unstablePackages "$@"
    '';

  };
}
