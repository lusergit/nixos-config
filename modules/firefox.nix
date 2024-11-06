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

    # screen sharing under wayland
    nativeMessagingHosts.packages = [ pkgs.plasma6Packages.plasma-browser-integration ];
    # use kde file picker
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
    wrapperConfig.pipewireSupport = true;
  };
}
