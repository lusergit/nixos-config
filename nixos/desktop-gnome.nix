{ config, lib, pkgs, ... }:
let
  cfg = config.luserModules.desktop-gnome;
in
{
  options.luserModules.desktop-gnome = {
    enable = lib.mkEnableOption "Gnome environment";
  };

  config = lib.mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
      };
    };
  };
}
