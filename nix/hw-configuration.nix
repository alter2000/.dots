{ config, lib, pkgs, ... }:

let
  lcfg = (if builtins.pathExists ./local.nix then ./local.nix else {});
in
{
  imports = [
    <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    (if (lcfg.server or false) then
        ./server-configuration.nix
      else
        ./laptop-configuration.nix)
  ];

  fileSystems = lib.mkDefault {
    "/" = {
      device = "/dev/disk/by-label/lunix";
      fsType = "btrfs";
      options = ["discard" "relatime" "subvol=@nixos" "compress=lzo" "space_cache"];
    };
    "/boot" = {
      device = "/dev/disk/by-partlabel/esp";
      fsType = "vfat";
    };
    "/home" = {
      device = "/dev/disk/by-label/lunix";
      fsType = "btrfs";
      options = ["discard" "relatime" "subvol=@home" "compress=lzo" "space_cache"];
    };
  };

  swapDevices = lib.mkDefault [ {
    device = "/dev/disk/by-partlabel/Swap";
  } ];

  boot = lib.mkDefault {
    kernelPackages = pkgs.linuxPackages_latest;
    initrd = {
      checkJournalingFS = true;
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

    plymouth = {
      enable = true;
      theme = "breeze";
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
}
