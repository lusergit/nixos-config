{ ... }:
{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.luser =
        { pkgs, ... }:
        {
          imports = [
            ./homeManager/development.nix
            ./homeManager/emacs.nix
            ./homeManager/fish.nix
            ./homeManager/mail.nix
          ];

          home = {
            packages = [
              pkgs.discord
              pkgs.spotify
              pkgs.telegram-desktop
              pkgs.mattermost-desktop
            ];
            stateVersion = "24.05";
          };
        };
    };
  };
}
