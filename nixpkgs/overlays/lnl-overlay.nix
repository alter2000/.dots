self: super:

{
  userPackages = super.userPackages or {} // {

    binutils = self.binutils;
    gdb = self.gdb;
    manpages = self.manpages;
    tcsh = self.tcsh;
    valgrind = self.valgrind;

    jrnl = self.jrnl;
    xbanish = self.xbanish;
    xorg.xinit = self.xorg.xinit;

    feedreader = self.feedreader;
    fractal = self.fractal;

    platformio = self.platformio;
    python37Packages.mps-youtube = self.python37Packages.mps-youtube;
    steam = self.steam;
    texlive.combined.scheme-full = self.texlive.combined.scheme-full;

    nix-rebuild = super.writeScriptBin "nix-env-rebuild" ''
      #!${super.stdenv.shell}
      if ! command -v nix-env &>/dev/null; then
          echo "warning: nix-env was not found in PATH, add nix to userPackages" >&2
          PATH=${self.nix}/bin:$PATH
      fi
      exec nix-env -f '<nixpkgs>' -r -iA userPackages "$@"
    '';

  };
}
