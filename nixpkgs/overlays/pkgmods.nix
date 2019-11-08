self: super:

let
  unstable = import (fetchTarball "channel:nixpkgs-unstable") {
        config = self.config;
      };

  snack = import (fetchTarball "https://github.com/nmattia/snack/tarball/master");

  nur = import (fetchTarball "https://github.com/nix-community/NUR/tarball/master") {
        pkgs = self.pkgs;
      };

in

{

  polybar = super.polybar.override {
    githubSupport = true;
    i3Support = true;
    nlSupport = true;
    mpdSupport = true;
    pulseSupport = true;
  };

  vimHugeX = super.vimHugeX.override {
    python = self.python3;
  };

  sudo = super.sudo.override {
    withInsults = true;
  };

  endless-sky = super.callPackage ../pkgs/endless-sky {};
  slurm-git = super.callPackage ../pkgs/slurm-git {};

  # compton = super.compton.override {
  #   configFile = ../../compton.conf;
  # };

  unstablePackages = super.unstablePackages or {} // {
    inherit (unstable)
      polybar
      # firefox
      # minecraft
      # nixfmt
    ;
  };

  randomGithubPackagesIFoundAround = {
    inherit (snack) snack-exe;
  };

}
