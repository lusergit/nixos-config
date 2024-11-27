{
  config,
  lib,
  pkgs,
  ...
}:

{
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
}
