self: super:

let
  unstable = import (builtins.fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz) {
        config = self.config;
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

  # compton = super.compton.override {
  #   configFile = ../../compton.conf;
  # };

  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    pkgs = self.pkgs;
  };

  unstablePackages = super.unstablePackages or {} // {
    polybar = unstable.polybar;
    firefox = unstable.firefox;
    # oraclejdk8 = unstable.oraclejdk8;
  };

}
