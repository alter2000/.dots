{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "alterpaper"; # Define your hostname.
    dhcpcd.enable = false;
    networkmanager.enable = true;  # Enables wireless support via wpa_supplicant.
    useDHCP = true;

    hosts = {
      "127.0.0.1" = [ "localhost" ];
      "192.168.0.1" = [ "lanlocal" ];
    };

    # Open ports in the firewall.
    firewall = {
      allowedTCPPorts = [ 25 40 80 443 4000 ];
      allowedUDPPorts = [ 25 40 80 443 4000 ];
      allowedTCPPortRanges = [ { from = 60000; to = 65535; } ];
      allowedUDPPortRanges = [ { from = 60000; to = 65535; } ];
    };
  };

  hardware = {
    cpu.intel.updateMicrocode = true;

    pulseaudio = {
      enable = true;
      support32Bit = true;
    };

    trackpoint = {
      emulateWheel = true;
      enable = true;
      sensitivity = 130;
      speed = 120;
    };

    opengl.driSupport32Bit = true;
    opengl.driSupport = true;

    # bluetooth = {
    #   enable = true;
    #   extraConfig = ''
    #     [General]
    #     Enable=Source,Sink,Media,Socket
    #   '';
    # };

  };

  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkDefault "powersave";
    powertop.enable = true;
  };

  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "3%";
    };
  };

}
