# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
    ./hw-configuration.nix
    ./pkgs.nix
    ./progs.nix
    ./services.nix
    ./systemd.nix
    ./users.nix
  ];

  security = {
    pam = {
      enableSSHAgentAuth = true;
      usb.enable = true;
    };
    polkit.enable = true;
    rngd.enable = true;
    rtkit.enable = true;
    sudo = {
      enable = true;
      extraConfig = ''
        Defaults	insults
        # Defaults	rootpw
      '';
    };
  };

  nix = {
    allowedUsers = ["@wheel"];
    autoOptimiseStore = true;
    buildCores = 3;
    maxJobs = 3;
    gc = {
      automatic = true;
      # dates = ["wed" "sun"];
    };
    optimise = {
      automatic = true;
      # dates = ["wed" "sun"];
    };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system = {
    nixos.tags = ["alterpad"];
    stateVersion = "19.03"; # Did you read the comment?
  };

}
