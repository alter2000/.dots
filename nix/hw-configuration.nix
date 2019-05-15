{ config, lib, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/lunix";
      fsType = "btrfs";
      options = ["discard" "relatime" "subvol=@nixos"];
    };
    "/boot" = {
      device = "/dev/disk/by-partlabel/esp";
      fsType = "vfat";
    };
    "/home" = {
      device = "/dev/disk/by-label/lunix";
      fsType = "btrfs";
      options = ["discard" "relatime" "subvol=@home"];
    };

  };

  networking = {
    hostName = "alterpad"; # Define your hostname.
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

  swapDevices = [ {
    device = "/dev/disk/by-partlabel/Swap";
  } ];

  boot = {

    initrd = {
      # kernelPackages = pkgs.linuxPackages_5_0;
      # checkJournalingFS = true;
      supportedFilesystems = [
        "btrfs"
        "vfat"
        "ext4"
        "exfat"
      ];
      availableKernelModules = [
        "btrfs"
        "crc32c_intel"
        "nvme"
        "rfkill"
        "scsi_mod"
        "sd_mod"
        "usb_storage"
        "usbhid"
        "xhci_pci"
      ];
    };

    loader = {
      systemd-boot = {
        enable = true;
        # editor = false;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub.enable = false;
      timeout = 2;
    };
    tmpOnTmpfs = true;
    # earlyVconsoleSetup = true;
  };

  nix.maxJobs = lib.mkDefault 3;

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
