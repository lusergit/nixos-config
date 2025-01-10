{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.luserModules.desktop-kde;
in
{
  options.luserModules.desktop-kde = {
    enable = lib.mkEnableOption "KDE Plasma environment";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.kdePackages; [
      sddm-kcm
      plymouth-kcm
      kgpg
      (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
        [General]
        background = ${pkgs.background-package}/light.png
      '')
    ];
    services = {
      displayManager.sddm = {
        enable = true;
        wayland = {
          enable = true;
          compositor = "kwin";
        };
      };

      desktopManager.plasma6.enable = true;
    };
  };
}
