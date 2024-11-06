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
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
    nativeMessagingHosts.packages = [ pkgs.plasma5Packages.plasma-browser-integration ];
  };
}
