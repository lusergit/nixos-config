{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.mpv.enable = true;
  services.mpris-proxy.enable = true;
}
