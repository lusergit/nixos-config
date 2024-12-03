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
      ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
