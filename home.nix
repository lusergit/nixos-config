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
            ./modules/development.nix
            ./modules/emacs.nix
            ./modules/media.nix
            ./modules/fish.nix
          ];
          home.stateVersion = "24.05";
        };
    };
  };
}
