{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking = {
    networkmanager.enable = true;
    hostName = "lHost";
  };
}
