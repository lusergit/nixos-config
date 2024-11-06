{
  config,
  lib,
  pkgs,
  ...
}:

{
  config = {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
    };
    programs.fish = {
      enable = true;
    };
  };
}
