{
  pkgs,
  user ? "luser",
  ...
}:
{
  imports = [
    ./development.nix
    ./emacs.nix
    ./fish.nix
    ./mail.nix
    ./gnome.nix
    ./firefox.nix
  ];

  nix.settings = {
    commit-lockfile-summary = "chore(nix): update inputs";
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  nixpkgs.config.allowUnfree = true;
  xdg.configHome = "/home/${user}/.config/";
  xdg.enable = true;

  home = {
    username = user;
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      discord
      spotify
      telegram-desktop
      mattermost-desktop
      gimp-with-plugins
      ispell
      aspell
      reuse
    ];
    stateVersion = "24.11";
  };
}
