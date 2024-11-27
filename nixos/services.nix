{
  config,
  lib,
  pkgs,
  ...
}:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkbVariant = "alt-intl,";
      xkbOptions = "ctrl:nocaps";
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    desktopManager.plasma6.enable = true;

    flatpak.enable = true;

    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        domain = true;
        hinfo = true;
        userServices = true;
      };
    };

    fwupd.enable = true;

    displayManager = {
      sessionPackages = [ config.home-manager.users.luser.programs.niri.package ];
    };
  };
}
