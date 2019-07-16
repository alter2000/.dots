{ config, lib, pkgs, ... }:

let
  lcfg = (if builtins.pathExists ./local.nix then ./local.nix else {});
in
{
  networking = {
    hostName = lcfg.networking.hostName or "alterpad";
    dhcpcd.enable = false;
    networkmanager.enable = true;
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
    cpu.intel.updateMicrocode = lcfg.hardware.cpu.intel.updateMicrocode or true;

    pulseaudio = lcfg.hardware.pulseaudio or {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
    };

    trackpoint = lcfg.hardware.trackpoint or {
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

  # From https://github.com/NixOS/nixpkgs/issues/45492#issuecomment-418903252
  # Set limits for esync.
  systemd.extraConfig = "DefaultLimitNOFILE=1048576";

  security.pam.loginLimits = [{
      domain = "*";
      type = "hard";
      item = "nofile";
      value = "1048576";
  }];

  services = {
    thinkfan = {
      enable = true;
      fan = "tp_fan /proc/acpi/ibm/fan";
      levels = ''
        (0,	0,	42)
        (1,	41,	45)
        (2,	44,	48)
        (3,	47,	51)
        (4,	50,	53)
        (5,	53,	60)
        (6,	55,	66)
        (7,	63,	32767)
      '';
      sensors = ''
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp1_input
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp2_input
        hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon2/temp3_input
      '';
      # levels = ''
      #   (0,	0,	47)
      #   (1,	46,	51)
      #   (2,	50,	55)
      #   (3,	54,	58)
      #   (4,	57,	62)
      #   (5,	60,	66)
      #   (6,	55,66)
      #   (7,	63,	32767)
      # '';
    };

    xserver = (import ./xserver.nix { inherit pkgs; });

    xbanish.enable = true;

    redshift = {
      enable = true;
      latitude = "50";
      longitude = "10";
      temperature.day = 6300;
      temperature.night = 4200;
      extraOptions = [ "-g 0.8" ];
    };

  };

}
