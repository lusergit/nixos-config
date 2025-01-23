{ ... }:

{
  config = {
    xdg.configFile."fish/themes/modus-vivendi.theme".source = ./fish_themes/modus-vivendi.theme;
    xdg.configFile."fish/themes/modus-operandi.theme".source = ./fish_themes/modus-operandi.theme;
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

        ls = "exa -1lxXh --smart-group --git";
        la = "exa -1lxXha --smart-group --git";

        tpmrefresh = "sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+2+7 --wipe-slot=tpm2 /dev/nvme0n1p3";
      };
    };
  };
}
