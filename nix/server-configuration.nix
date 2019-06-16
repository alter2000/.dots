{ config, lib, pkgs, ... }:

let
  lcfg = (if builtins.pathExists ./local.nix then ./local.nix else {});
in
{
  networking = {
    hostName = lcfg.networking.hostName or "alterbox";
    dhcpcd.enable = true;
    useDHCP = false;

    hosts = {
      "127.0.0.1" = [ "localhost" ];
    };

    # Open ports in the firewall.
    firewall = {
      allowedTCPPorts = [ 25 40 80 443 4000 ];
      allowedUDPPorts = [ 25 40 80 443 4000 ];
      allowedTCPPortRanges = lcfg.openTCPPortRange or [ { from = 60000; to = 65535; } ];
      allowedUDPPortRanges = lcfg.openUDPPortRange or [ { from = 60000; to = 65535; } ];
    };
  };
}
