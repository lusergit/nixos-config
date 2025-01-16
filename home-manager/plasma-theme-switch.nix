{
  pkgs,
  config,
  lib,
  ...
}:

let
  cfg = config.homeModules.plasma-theme-switch;
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;
in
{

  options.homeModules.plasma-theme-switch = {
    enable = mkEnableOption "switch plasma theme based on location";
    sourceNix = mkOption {
      type = types.bool;
      default = false;
      description = "Enable darkman to handle theme switching based on the time of day";
    };
  };

  config = mkIf cfg.enable {
    services.darkman = {
      enable = true;

      settings = {
        lat = 45.4105;
        lng = 11.8782;
      };

      lightModeScripts = {
        breeze_light = ''
          lookandfeeltool -a org.kde.breeze.desktop
        '';

        light_wallpaper = ''
          plasma-apply-wallpaperimage ${pkgs.background-package}/light.png
        '';
      };

      darkModeScripts = {
        breeze_dark = ''
          lookandfeeltool -a org.kde.breezedark.desktop
        '';
        dark_wallpaper = ''
          plasma-apply-wallpaperimage ${pkgs.background-package}/dark.png
        '';
      };
    };
  };
}
