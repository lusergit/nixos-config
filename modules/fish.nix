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
      interactiveShellInit = ''
        set -U fish_creeting
      '';
      loginShellInit = "starship init fish | source";
    };
  };
}
