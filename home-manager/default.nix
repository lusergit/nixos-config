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
  xdg = {
    configHome = "/home/${user}/.config/";
    enable = true;
    configFile = {
      "autostart/mattermost.desktop".source = "${pkgs.mattermost-desktop}/share/applications/Mattermost.desktop";
      "autostart/thunderbird.desktop".source = "${pkgs.thunderbird}/share/applications/thunderbird.desktop";
    };
  };

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
