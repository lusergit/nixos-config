{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs = {
    fish.enable = true;
    git.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    firefox = {
      enable = true;
      preferences = {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "widget.use-xdg-desktop-portal.mime-handler" = 1;
      };
    };
    virt-manager.enable = true;
    steam.enable = true;

    nix-index.enable = true;
    command-not-found.enable = false;
  };
}
