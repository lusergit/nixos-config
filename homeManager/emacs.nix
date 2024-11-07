{ pkgs, ... }:
{

  programs.emacs = {
    enable = true;
  };

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
  };
}
