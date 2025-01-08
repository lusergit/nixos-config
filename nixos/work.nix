{ config, lib, pkgs, ... }:
let
  cfg = config.luserModules.work;
in
{
  options.luserModules.work = {
    enable = lib.mkEnableOption "Work PC configuration";
  };

  config = lib.mkIf cfg.enable {
    users.users.tech = {
      isNormalUser = true;
      group = "tech";
      extraGroups = [ "wheel" ];
      uid = 1001;
    };
    users.groups.tech.gid = 1001;

    hardware = {
      enableAllFirmware = true;
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          vaapiVdpau
          vulkan-validation-layers
          vulkan-extension-layer
          vaapiIntel
          intel-media-driver
          intel-compute-runtime
        ];
      };

      pulseaudio.enable = false;
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };
  };
}
