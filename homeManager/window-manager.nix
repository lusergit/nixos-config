{ ... }:

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
      '';
    };

    darkModeScripts = {
      breeze_light = ''
      lookandfeeltool -a org.kde.breezedark.desktop
      '';
    };
  };
}
