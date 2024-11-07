{ ... }:
{
  config = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.luser =
        { ... }:
        {
          imports = [
            ./homeManager/kde.nix
            ./homeManager/development.nix
            ./homeManager/emacs.nix
            ./homeManager/media.nix
            ./homeManager/fish.nix
          ];
          home.stateVersion = "24.05";
        };
    };
  };
}
