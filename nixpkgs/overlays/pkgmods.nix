self: super:

let
  unstable = import (fetchTarball "https://github.com/nixos/nixpkgs/tarball/master") {
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
    # i3GapsSupport = true;
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

  # minikube = super.callPackage ../pkgs/minikube {};

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
      # oraclejdk8
      # nixfmt
    ;
    inherit (self)
      deluge
    ;
  };

  randomGithubPackagesIFoundAround = {
    inherit (snack) snack-exe;
  };

}
