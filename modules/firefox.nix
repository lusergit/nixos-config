{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.firefox = {
    enable = true;
    profiles = {
      "luser" = {
        id = 0;
        isDefault = true;
      };

      "work" = {
        id = 1;
      };
    };
  };
}
