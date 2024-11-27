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
        set fish_greeting ""
        set -U fish_cursor_default block
      '';
      shellAliases = {
        ec = "emacsclient -c";
        et = "emacsclient -t";

        estart = "systemctl --user start emacs";
        estop = "systemctl --user stop emacs";
        erestart = "systemctl --user restart emacs";
        estatus = "systemctl --user status emacs";

        ls = "ls --color=auto -gh";
        la = "ls --color=auto -gah";
      };
    };
  };
}
