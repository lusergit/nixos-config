{ pkgs, ... }:

{
  services.darkman = {
    enable = true;

    settings = {
      lat = 45.4105;
      lng = 11.8782;
    };

    lightModeScripts = {
      breeze_light = ''
        lookandfeeltool -a org.kde.breeze.desktop
        plasma-apply-wallpaperimage ${pkgs.background-package}/light.png
      '';
    };

    darkModeScripts = {
      breeze_dark = ''
        lookandfeeltool -a org.kde.breezedark.desktop
        plasma-apply-wallpaperimage ${pkgs.background-package}/dark.png
      '';
    };
  };
}
