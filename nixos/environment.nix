{
  pkgs,
  ...
}:
{
  environment = {
    systemPackages =
      with pkgs;
      with kdePackages;
      [
        wget
        docker-compose
        wl-clipboard
        sddm-kcm
        plymouth-kcm
        discover
        kgpg
        mpvpaper
        linux-wallpaperengine
        gimp-with-plugins
        geoclue2
        (pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
          [General]
          background = ${pkgs.background-package}/light.png
        '')
      ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
