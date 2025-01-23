{
  config,
  lib,
  pkgs,
  ...
}:
let
  extensions = with pkgs.gnomeExtensions; [
    search-light
    night-theme-switcher
  ];
in
{
  programs.gnome-shell = {
    enable = true;
    extensions = map (package: { inherit package; }) extensions;
  };

  dconf.settings = {
    "org/gnome/mutter" = {
      experimental-features = [ "scale-monitor-framebuffer" ];
    };
  };
}
