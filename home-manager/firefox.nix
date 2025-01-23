{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css"
      '';
      userContent = ''
        @import "firefox-gnome-theme/userContent.css"
      '';

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.drawInTitlebar" = true;
        "svg.context-properties.content.enabled" = true;
        "browser.theme.dark-private-windows" = false;
        "browser.uidensity" = 0;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
      };
    };
  };

  home.file."firefox-gnome-theme" = {
    target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
    source = inputs.firefox-gnome-theme;
  };
}
