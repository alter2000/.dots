self: super:

let
  unstable = import (builtins.fetchTarball
      "channel:nixos-unstable") {
        config = self.config;
      };

  snack = import (builtins.fetchTarball "https://github.com/nmattia/snack/tarball/master");

  nur = import (builtins.fetchTarball
      "https://github.com/nix-community/NUR/tarball/master") {
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

  minikube = super.minikube.overrideAttrs (old: rec {
    version = "v1.4.0";
    src = self.fetchFromGitHub {
      owner = "kubernetes";
      repo = "minikube";
      rev = "${version}";
      sha256 = "1wq0qhv2zlj3ndrv3ppp2hzb076kwni3mlr9j5jy04zdjxx705rs";
    };
  });

  endless-sky = super.callPackage ../pkgs/endless-sky {};
  slurm-git = super.callPackage ../pkgs/slurm-git {};

  # compton = super.compton.override {
  #   configFile = ../../compton.conf;
  # };

  unstablePackages = super.unstablePackages or {} // {
    inherit (unstable)
      polybar
      firefox
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
