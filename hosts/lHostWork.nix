{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot = {
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
    loader = {
      systemd-boot.enable = true;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/efi";
      };
    };

    initrd = {
      systemd = {
        enable = true;
        tpm2.enable = true;
      };
      services.lvm.enable = true;
      luks.devices.cryptroot.device = "/dev/disk/by-uuid/9861a123-4502-4c63-9b21-507d36fe542c";

      kernelModules = [ "dm-snapshot" ];
      availableKernelModules = [
        "vmd"
        "xhci_pci"
        "ahci"
        "nvme"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "rtsx_pci_sdmmc"
      ];
      verbose = false;
    };

    plymouth = {
      enable = true;
    };

    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    loader.timeout = 0;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/0a423eb1-52e6-406f-9eaf-de3efd50622c";
    fsType = "btrfs";
    options = [
      "defaults"
      "compress=zstd"
      "subvol=root"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/0a423eb1-52e6-406f-9eaf-de3efd50622c";
    fsType = "btrfs";
    options = [
      "defaults"
      "compress=zstd"
      "subvol=home"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/0a423eb1-52e6-406f-9eaf-de3efd50622c";
    fsType = "btrfs";
    options = [
      "defaults"
      "compress=zstd"
      "subvol=nix"
    ];
  };

  fileSystems."/efi" = {
    device = "/dev/disk/by-uuid/4DCF-01DC";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/e7df7078-b56f-4135-bfe7-530ca8617fc0";
    fsType = "ext4";
  };

  swapDevices = [ { device = "/dev/disk/by-uuid/b1533042-571d-4b28-a967-6a8a0c713d46"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
