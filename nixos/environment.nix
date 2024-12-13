{
  pkgs,
  ...
}:
let
  background-package = pkgs.stdenvNoCC.mkDerivation {
    name = "background-image";
    src = ../wallpapers;
    dontUnpack = true;
    installPhase = ''
      cp -r $src $out
    '';
  };
in
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
        (
          pkgs.writeTextDir "share/sddm/themes/breeze/theme.conf.user" ''
          [General]
          background = ${background-package}/Green_icons.png
          ''
        )
      ];
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };
}
