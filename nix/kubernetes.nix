{ config, pkgs, ... }:

{
  services.kubernetes = {
    roles = [ "master" "node" ];
    kubelet.extraOpts = "--fail-swap-on=false";
    easyCerts = true;
    # addons.dashboard.enable = true;
    # apiserver = {
    #   securePort = 443;
    #   advertiseAddress = config.networking.privateIPv4;
    # };
    masterAddress = "localhost";
  };
}
